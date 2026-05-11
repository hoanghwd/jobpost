(function () {
    const form = document.getElementById('manualApplicantForm');
    if (!form) return;

    const alertBox = document.getElementById('manualApplicantAlert');
    const dropZone = document.getElementById('manualResumeDropZone');
    const fileInput = document.getElementById('manualResume');
    const fileName = document.getElementById('manualResumeFileName');
    const resumePreview = document.getElementById('manualResumePreview');
    const resumeError = document.getElementById('manualResumeError');
    const firstName = document.getElementById('manualFirstName');
    const lastName = document.getElementById('manualLastName');
    const phone = document.getElementById('manualPhone');
    const email = document.getElementById('manualEmail');
    const jobBoard = document.getElementById('manualJobBoard');
    const jobPost = document.getElementById('manualJobPost');
    const duplicateButton = document.getElementById('manualDuplicateCheck');
    const duplicateResult = document.getElementById('manualDuplicateResult');
    const selectedAccountInput = document.getElementById('manualSelectedAccountId');
    const submitUrl = form.getAttribute('action') || '/process-applicants/manual/store';
    const accountStorageKey = 'jp_selected_account_id';
    let nextAction = 'stay';

    function setDuplicateResult(type, message) {
        if (!duplicateResult) return;
        duplicateResult.className = 'manual-duplicate-result';
        if (type) {
            duplicateResult.classList.add('is-' + type);
        }
        duplicateResult.textContent = message || '';
    }

    function showAlert(type, message) {
        alertBox.className = 'manual-alert ' + type;
        alertBox.textContent = message;
        alertBox.classList.remove('d-none');
    }

    function escapeHtml(value) {
        return String(value || '').replace(/[&<>"']/g, function (char) {
            return ({'&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#039;'})[char];
        });
    }

    function showSweetAlert(options) {
        if (typeof Swal !== 'undefined' && Swal.fire) {
            Swal.fire(Object.assign({position: 'center', heightAuto: false}, options));
            return;
        }
        alert(options.text || options.title || '');
    }

    function formatDuplicateDate(value) {
        if (!value) return 'No date';
        const date = new Date(String(value).replace(' ', 'T'));
        if (Number.isNaN(date.getTime())) return value;
        return date.toLocaleDateString(undefined, {year: 'numeric', month: 'short', day: 'numeric'});
    }

    function phoneDigits(value) {
        return String(value || '').replace(/\D+/g, '').slice(0, 10);
    }

    function formatPhone(value) {
        const digits = phoneDigits(value);
        return [digits.slice(0, 3), digits.slice(3, 6), digits.slice(6, 10)].filter(Boolean).join(' ');
    }

    function getAllowedResumeExtensions() {
        return ['pdf', 'doc', 'docx', 'txt', 'rtf'];
    }

    function getFileExtension(fileName) {
        const parts = String(fileName || '').toLowerCase().split('.');
        return parts.length > 1 ? parts.pop() : '';
    }

    function getResumeTypeLabel(extension) {
        const ext = String(extension || '').toLowerCase();
        if (ext === 'pdf') return 'PDF';
        if (ext === 'doc' || ext === 'docx') return 'DOC';
        if (ext === 'txt') return 'TXT';
        if (ext === 'rtf') return 'RTF';
        return 'FILE';
    }

    function getResumeIconClass(extension) {
        const ext = String(extension || '').toLowerCase();
        if (ext === 'pdf') return 'is-pdf';
        if (ext === 'doc' || ext === 'docx') return 'is-doc';
        if (ext === 'txt') return 'is-txt';
        if (ext === 'rtf') return 'is-rtf';
        return 'is-file';
    }

    function showResumeError(message) {
        if (!resumeError) {
            showAlert('error', message);
            return;
        }
        resumeError.textContent = message || '';
        resumeError.classList.toggle('d-none', !message);
    }

    function clearResumeError() {
        showResumeError('');
    }

    function clearResumeFile() {
        fileInput.value = '';
        updateFileName();
    }

    function keepOnlyFirstFile(fileList) {
        if (!fileList || !fileList.length) return null;
        const first = fileList[0];
        if (window.DataTransfer) {
            const transfer = new DataTransfer();
            transfer.items.add(first);
            fileInput.files = transfer.files;
        }
        return first;
    }

    function validateResumeFile(file) {
        if (!file) {
            clearResumeError();
            return true;
        }

        const extension = getFileExtension(file.name);
        if (getAllowedResumeExtensions().indexOf(extension) === -1) {
            showResumeError('Resume upload only allows PDF, DOC, DOCX, TXT, or RTF files.');
            clearResumeFile();
            return false;
        }

        if (file.size > 10 * 1024 * 1024) {
            showResumeError('Resume must be 10 MB or smaller.');
            clearResumeFile();
            return false;
        }

        clearResumeError();
        return true;
    }

    function getSelectedJobLabel() {
        const option = jobPost.options[jobPost.selectedIndex];
        return option ? option.textContent : '';
    }

    function getSelectedJobBoardLabel() {
        const option = jobBoard.options[jobBoard.selectedIndex];
        return option ? option.textContent : '';
    }

    function buildDuplicateParams() {
        return new URLSearchParams({
            ajax: 'duplicates',
            first_name: firstName.value || '',
            last_name: lastName.value || '',
            email: email.value || '',
            phone: phoneDigits(phone.value),
            job_board_id: jobBoard.value || '',
            job_post_id: jobPost.value || '',
            selected_account_id: selectedAccountInput.value || ''
        });
    }

    function validateDuplicateInputs(showMessage) {
        const hasIdentity = Boolean(
            String(firstName.value || '').trim()
            || String(lastName.value || '').trim()
            || String(email.value || '').trim()
            || phoneDigits(phone.value)
        );

        if (!jobBoard.value) {
            if (showMessage) duplicateResult.textContent = 'Select a job board before checking duplicates.';
            return false;
        }
        if (!jobPost.value) {
            if (showMessage) duplicateResult.textContent = 'Select the job before checking duplicates.';
            return false;
        }
        if (!hasIdentity) {
            if (showMessage) duplicateResult.textContent = 'Enter at least one applicant field: first name, last name, phone, or email.';
            return false;
        }
        return true;
    }

    function requestDuplicateCheck() {
        const params = buildDuplicateParams();
        return fetch('/process-applicants/manual?' + params.toString(), {
            credentials: 'same-origin',
            headers: {'X-Requested-With': 'XMLHttpRequest'}
        })
            .then(function (response) {
                return response.text().then(function (text) {
                    let payload;
                    try {
                        payload = JSON.parse(text);
                    } catch (error) {
                        throw new Error('Duplicate check returned an invalid response.');
                    }
                    if (!response.ok || !payload.success) {
                        throw new Error(payload.message || 'Duplicate check failed.');
                    }
                    return payload;
                });
            });
    }

    function renderDuplicateRows(duplicates) {
        return (duplicates || []).slice(0, 10).map(function (item) {
            const name = item.full_name || [item.first_name, item.last_name].filter(Boolean).join(' ') || 'No name';
            const source = item.job_board_name || item.source_system || getSelectedJobBoardLabel() || 'No source';
            const status = item.is_blocking_duplicate ? 'Blocked: within 30 days' : (item.latest_status || 'Allowed after 30 days / review');
            return '<tr class="' + (item.is_blocking_duplicate ? 'is-blocking' : '') + '">' +
                '<td>' + escapeHtml(name) + '</td>' +
                '<td>' + escapeHtml(item.email || 'No email') + '</td>' +
                '<td>' + escapeHtml(item.phone || 'No phone') + '</td>' +
                '<td>' + escapeHtml(item.job_title || getSelectedJobLabel() || 'No job') + '</td>' +
                '<td>' + escapeHtml(source) + '</td>' +
                '<td>' + escapeHtml(formatDuplicateDate(item.applied_utc || item.created_utc)) + '</td>' +
                '<td>' + escapeHtml(status) + '</td>' +
                '</tr>';
        }).join('');
    }

    function showDuplicatePopup(payload, options) {
        options = options || {};
        const duplicates = payload.duplicates || [];
        const count = payload.duplicate_count || duplicates.length || 0;
        const blockingCount = payload.blocking_duplicate_count || duplicates.filter(function (item) {
            return Boolean(item.is_blocking_duplicate);
        }).length;
        const title = blockingCount
            ? 'Duplicate blocked'
            : count + ' Possible match' + (count === 1 ? '' : 'es') + ' found';
        const text = blockingCount
            ? 'This applicant already applied to the same job from the same job board within the last 30 days.'
            : 'Possible duplicate found. Save only if this is allowed.';

        const html = '<p class="manual-duplicate-summary">' + escapeHtml(text) + '</p>' +
            '<div class="manual-duplicate-table-wrap">' +
            '<table class="manual-duplicate-table">' +
            '<thead><tr><th>Name</th><th>Email</th><th>Phone</th><th>Job Applied</th><th>Source</th><th>Date Applied</th><th>Status</th></tr></thead>' +
            '<tbody>' + renderDuplicateRows(duplicates) + '</tbody>' +
            '</table>' +
            '</div>';

        if (typeof Swal !== 'undefined' && Swal.fire) {
            return Swal.fire({
                title: title,
                html: html,
                icon: blockingCount ? 'error' : 'warning',
                showCancelButton: Boolean(options.confirmAllowed && !blockingCount),
                confirmButtonText: options.confirmAllowed && !blockingCount ? 'Yes, Save Applicant' : 'OK',
                cancelButtonText: 'Cancel',
                position: 'center',
                heightAuto: false,
                customClass: {popup: 'manual-duplicate-popup'}
            });
        }

        alert(text);
        return Promise.resolve({isConfirmed: Boolean(options.confirmAllowed && !blockingCount)});
    }

    function setDuplicateOverride(enabled) {
        let input = form.querySelector('input[name="duplicate_override"]');
        if (!input) {
            input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'duplicate_override';
            form.appendChild(input);
        }
        input.value = enabled ? '1' : '0';
    }

    function submitManualApplicant(allowDuplicateOverride) {
        setDuplicateOverride(Boolean(allowDuplicateOverride));
        const buttons = form.querySelectorAll('button[type="submit"]');
        buttons.forEach(function (button) {
            button.disabled = true;
        });

        fetch(submitUrl, {
            method: 'POST',
            body: new FormData(form),
            credentials: 'same-origin',
            headers: {'X-Requested-With': 'XMLHttpRequest'}
        })
            .then(function (response) {
                return response.json().then(function (payload) {
                    if (!response.ok || !payload.success) {
                        const error = new Error(payload.message || 'Save failed.');
                        error.payload = payload;
                        throw error;
                    }
                    return payload;
                });
            })
            .then(function (payload) {
                showAlert('success', payload.message || 'Applicant saved successfully.');
                if (nextAction === 'list') {
                    window.location.href = '/process-applicants/app-received';
                    return;
                }
                form.reset();
                setDuplicateOverride(false);
                updateFileName();
                syncSelectedAccount('');
                loadJobsForBoard();
            })
            .catch(function (error) {
                const payload = error.payload || {};
                if ((payload.duplicate_blocked || payload.can_override) && Array.isArray(payload.duplicates)) {
                    showDuplicatePopup(payload, {confirmAllowed: Boolean(payload.can_override)}).then(function (result) {
                        if (payload.can_override && result && result.isConfirmed) {
                            submitManualApplicant(true);
                        } else {
                            showAlert('error', payload.message || 'Duplicate applicant found.');
                        }
                    });
                    return;
                }
                showAlert('error', error.message || 'Failed to save applicant.');
            })
            .finally(function () {
                buttons.forEach(function (button) {
                    button.disabled = false;
                });
            });
    }

    function validatePhone() {
        const digits = phoneDigits(phone.value);
        if (digits.length !== 10) {
            phone.setCustomValidity('Enter 10 digits, like 123 456 7680.');
            return false;
        }
        phone.setCustomValidity('');
        phone.value = formatPhone(digits);
        return true;
    }

    function updateFileName() {
        const file = fileInput.files && fileInput.files[0] ? fileInput.files[0] : null;
        if (fileName) {
            fileName.textContent = file ? '1 file selected' : 'No file selected';
        }
        if (!resumePreview) return;

        if (!file) {
            resumePreview.className = 'manual-resume-preview is-empty';
            resumePreview.innerHTML = '';
            return;
        }

        const extension = getFileExtension(file.name);
        const typeLabel = getResumeTypeLabel(extension);
        const iconClass = getResumeIconClass(extension);
        resumePreview.className = 'manual-resume-preview';
        resumePreview.innerHTML =
            '<div class="manual-resume-file-card">' +
                '<button type="button" class="manual-resume-remove" id="manualResumeRemove" aria-label="Remove uploaded resume">×</button>' +
                '<div class="manual-resume-file-icon ' + escapeHtml(iconClass) + '" aria-hidden="true">' +
                    '<span class="manual-resume-file-corner"></span>' +
                    '<span class="manual-resume-file-lines"><i></i><i></i><i></i></span>' +
                    '<span class="manual-resume-file-type">' + escapeHtml(typeLabel) + '</span>' +
                '</div>' +
                '<div class="manual-resume-file-name" title="' + escapeHtml(file.name) + '">' + escapeHtml(file.name) + '</div>' +
            '</div>';
    }

    function syncSelectedAccount(accountId) {
        selectedAccountInput.value = accountId || window.localStorage.getItem(accountStorageKey) || '';
    }

    function setJobOptions(options, placeholder) {
        jobPost.innerHTML = '';
        const first = document.createElement('option');
        first.value = '';
        first.textContent = placeholder || '-- Select a Job --';
        jobPost.appendChild(first);

        options.forEach(function (item) {
            const option = document.createElement('option');
            const jobId = parseInt(item.job_post_id || 0, 10);
            const title = item.job_title || ('Job #' + jobId);
            const location = item.job_location ? ' - ' + item.job_location : '';
            option.value = String(jobId);
            option.textContent = title + location;
            jobPost.appendChild(option);
        });
    }

    function loadJobsForBoard() {
        const jobBoardId = jobBoard.value || '';
        if (!jobBoardId) {
            setJobOptions([], '-- Select a Job Board First --');
            return;
        }

        setJobOptions([], 'Loading jobs...');
        const params = new URLSearchParams({
            ajax: 'job-posts',
            job_board_id: jobBoardId,
            selected_account_id: selectedAccountInput.value || ''
        });

        fetch('/process-applicants/manual?' + params.toString(), {
            credentials: 'same-origin',
            headers: {'X-Requested-With': 'XMLHttpRequest'}
        })
            .then(function (response) {
                return response.json();
            })
            .then(function (payload) {
                if (!payload.success) throw new Error(payload.message || 'Failed to load jobs.');
                const jobs = Array.isArray(payload.data) ? payload.data : [];
                setJobOptions(jobs, jobs.length ? '-- Select a Job --' : '-- No Jobs for Selected Board --');
            })
            .catch(function () {
                setJobOptions([], '-- Failed to Load Jobs --');
            });
    }

    form.querySelectorAll('button[type="submit"]').forEach(function (button) {
        button.addEventListener('click', function () {
            nextAction = button.getAttribute('data-next') || 'stay';
        });
    });

    fileInput.addEventListener('change', function () {
        const file = keepOnlyFirstFile(fileInput.files);
        if (validateResumeFile(file)) {
            updateFileName();
        }
    });
    if (resumePreview) {
        resumePreview.addEventListener('click', function (event) {
            const button = event.target.closest('.manual-resume-remove');
            if (!button) return;
            event.preventDefault();
            clearResumeFile();
            clearResumeError();
        });
    }
    phone.addEventListener('input', function () {
        phone.value = formatPhone(phone.value);
        if (phoneDigits(phone.value).length === 10) {
            phone.setCustomValidity('');
        }
    });
    phone.addEventListener('blur', validatePhone);
    jobBoard.addEventListener('change', loadJobsForBoard);
    syncSelectedAccount('');
    window.addEventListener('jp:account-filter-change', function (event) {
        syncSelectedAccount(event.detail && event.detail.accountId ? event.detail.accountId : '');
        loadJobsForBoard();
    });

    ['dragenter', 'dragover'].forEach(function (eventName) {
        dropZone.addEventListener(eventName, function (event) {
            event.preventDefault();
            dropZone.classList.add('is-dragging');
        });
    });
    ['dragleave', 'drop'].forEach(function (eventName) {
        dropZone.addEventListener(eventName, function (event) {
            event.preventDefault();
            dropZone.classList.remove('is-dragging');
        });
    });
    dropZone.addEventListener('drop', function (event) {
        if (event.dataTransfer && event.dataTransfer.files && event.dataTransfer.files.length) {
            const file = keepOnlyFirstFile(event.dataTransfer.files);
            if (!validateResumeFile(file)) {
                return;
            }
            updateFileName();
        }
    });

    duplicateButton.addEventListener('click', function () {
        setDuplicateResult('checking', 'Checking...');

        if (!validateDuplicateInputs(true)) {
            return;
        }

        requestDuplicateCheck()
            .then(function (payload) {
                const count = payload.duplicate_count || 0;
                const blockingCount = payload.blocking_duplicate_count || 0;
                if (!count) {
                    setDuplicateResult('success', 'No duplicate applicants found for this exact job and job board.');
                    return;
                }

                setDuplicateResult('error', blockingCount
                    ? blockingCount + ' duplicate applicant' + (blockingCount === 1 ? '' : 's') + ' blocked within 30 days.'
                    : count + ' possible previous applicant' + (count === 1 ? '' : 's') + ' found. Older than 30 days can be saved after confirmation.');

                showDuplicatePopup(payload, {confirmAllowed: false});
            })
            .catch(function (error) {
                setDuplicateResult('error', error.message || 'Duplicate check failed.');
            });
    });

    form.addEventListener('submit', function (event) {
        event.preventDefault();
        setDuplicateOverride(false);

        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }
        if (!validatePhone()) {
            form.reportValidity();
            return;
        }
        const file = fileInput.files && fileInput.files[0] ? fileInput.files[0] : null;
        if (!validateResumeFile(file)) {
            return;
        }
        if (!validateDuplicateInputs(true)) {
            return;
        }

        requestDuplicateCheck()
            .then(function (payload) {
                const count = payload.duplicate_count || 0;
                const blockingCount = payload.blocking_duplicate_count || 0;
                if (!count) {
                    submitManualApplicant(false);
                    return;
                }

                showDuplicatePopup(payload, {confirmAllowed: blockingCount === 0}).then(function (result) {
                    if (blockingCount > 0) {
                        showAlert('error', 'Applicant cannot be saved because the same applicant applied to this exact job board/job within the last 30 days.');
                        return;
                    }
                    if (result && result.isConfirmed) {
                        submitManualApplicant(true);
                    }
                });
            })
            .catch(function (error) {
                showAlert('error', error.message || 'Duplicate check failed.');
            });
    });

})();
