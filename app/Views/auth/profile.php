<?php declare(strict_types=1); ?>
<?php
$applicant = $_SESSION['auth']['applicant'] ?? [];
$profile = $profile ?? [];

$fullName = trim((string) ($applicant['full_name'] ?? ''));
if ($fullName === '') {
    $fullName = trim((string) (($applicant['first_name'] ?? '') . ' ' . ($applicant['last_name'] ?? '')));
}
if ($fullName === '') {
    $fullName = (string) ($applicant['username'] ?? 'Candidate');
}
$email = trim((string) ($applicant['email'] ?? ''));
$phone = trim((string) ($applicant['phone'] ?? ''));
$avatarLetter = strtoupper(substr($fullName !== '' ? $fullName : 'A', 0, 1));
if ($avatarLetter === '') {
    $avatarLetter = 'A';
}

$summaryHtml = (string) ($profile['profile_summary_html'] ?? '');
$workItems = is_array($profile['work_experience_json'] ?? null) ? $profile['work_experience_json'] : [];
$educationItems = is_array($profile['education_json'] ?? null) ? $profile['education_json'] : [];
$resumes = $resumes ?? [];
$tinyMceKey = trim((string) env('TINY_MCE', 'no-api-key'));
if ($tinyMceKey === '') {
    $tinyMceKey = 'no-api-key';
}
?>

<main class="indeed-page profile-page">
    <div class="indeed-shell">
        <header class="site-header">
            <div class="hero-nav">
                <div class="hero-nav-left">
                    <div class="brand">JobPost</div>
                    <nav>
                        <a href="/?tab=home">Home</a>
                        <a href="/?tab=company-reviews">Company reviews</a>
                        <a href="/?tab=find-salaries">Find salaries</a>
                    </nav>
                </div>
                <div class="hero-nav-right">
                    <div class="candidate-nav-icons">
                        <a href="#" class="candidate-icon-btn"><i class="bi bi-bookmark"></i></a>
                        <a href="#" class="candidate-icon-btn"><i class="bi bi-chat-left-text"></i></a>
                        <a href="#" class="candidate-icon-btn has-badge"><i class="bi bi-bell"></i><span class="candidate-count-badge">9+</span></a>
                        <div class="candidate-account-wrap">
                            <button type="button" class="candidate-profile-btn" data-account-toggle><span class="candidate-avatar"><?= htmlspecialchars($avatarLetter, ENT_QUOTES, 'UTF-8'); ?></span></button>
                            <div class="candidate-account-menu" data-account-menu>
                                <div class="candidate-account-name"><?= htmlspecialchars($fullName, ENT_QUOTES, 'UTF-8'); ?></div>
                                <a href="/profile" class="candidate-account-item">Profile</a>
                                <button type="button" class="candidate-account-item logout-btn" data-logout-btn>Log out</button>
                            </div>
                        </div>
                    </div>
                    <span class="top-sep">|</span>
                    <a href="https://jobportal.huynhdous.com/login" class="top-link">Employers / Post Job</a>
                </div>
            </div>
        </header>
        <hr class="header-divider">

        <section class="profile-wrap">
            <div class="profile-card">
                <div class="profile-head">
                    <h1><?= htmlspecialchars(strtoupper($fullName), ENT_QUOTES, 'UTF-8'); ?></h1>
                    <?php if ($phone !== ''): ?><p><?= htmlspecialchars($phone, ENT_QUOTES, 'UTF-8'); ?></p><?php endif; ?>
                    <?php if ($email !== ''): ?><p><?= htmlspecialchars($email, ENT_QUOTES, 'UTF-8'); ?></p><?php endif; ?>
                    <span class="profile-visible-chip"><i class="bi bi-eye"></i> Employers can find you <i class="bi bi-chevron-down"></i></span>
                </div>

                <div class="profile-tabs" id="profileTabs">
                    <button type="button" class="profile-tab active" data-tab="profile"><i class="bi bi-person-circle"></i> Profile</button>
                    <button type="button" class="profile-tab" data-tab="preferences"><i class="bi bi-sliders2"></i> Preferences</button>
                    <button type="button" class="profile-tab" data-tab="resume"><i class="bi bi-file-earmark-text"></i> Resume</button>
                </div>

                <div class="tab-panel active" data-panel="profile">
                    <div class="profile-section-head">
                        <h2><i class="bi bi-card-list"></i> Summary</h2>
                        <button type="button" class="section-icon-btn" data-edit-summary><i class="bi bi-pencil"></i></button>
                    </div>
                    <div class="profile-block summary-block" id="summaryBlock">
                        <?php if (trim(strip_tags($summaryHtml)) === ''): ?>
                            <p class="empty-copy">Add a short professional summary.</p>
                        <?php else: ?>
                            <div class="rich-content"><?= $summaryHtml; ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="profile-editor" id="summaryEditor">
                        <textarea id="summaryTextarea"><?= htmlspecialchars($summaryHtml, ENT_QUOTES, 'UTF-8'); ?></textarea>
                        <div class="editor-actions">
                            <button type="button" class="editor-btn primary" data-save-summary><i class="bi bi-check-lg"></i> Save</button>
                            <button type="button" class="editor-btn" data-cancel-summary>Cancel</button>
                            <button type="button" class="editor-btn danger" data-remove-summary><i class="bi bi-trash"></i> Remove</button>
                        </div>
                    </div>

                    <div class="profile-section-head">
                        <h2><i class="bi bi-briefcase"></i> Work experience</h2>
                        <button type="button" class="section-icon-btn" data-add-item data-section="work_experience"><i class="bi bi-plus-lg"></i></button>
                    </div>
                    <div id="workList">
                        <?php foreach ($workItems as $item): ?>
                            <article class="profile-block list-item" data-section="work_experience" data-item-id="<?= htmlspecialchars((string) ($item['item_id'] ?? ''), ENT_QUOTES, 'UTF-8'); ?>">
                                <div class="item-actions">
                                    <button type="button" class="mini-icon-btn" data-edit-item><i class="bi bi-pencil"></i></button>
                                    <button type="button" class="mini-icon-btn" data-remove-item><i class="bi bi-trash"></i></button>
                                </div>
                                <h3><?= htmlspecialchars((string) ($item['title'] ?? ''), ENT_QUOTES, 'UTF-8'); ?></h3>
                                <p class="item-meta"><?= htmlspecialchars((string) ($item['organization'] ?? ''), ENT_QUOTES, 'UTF-8'); ?><?= !empty($item['location']) ? ' • ' . htmlspecialchars((string) $item['location'], ENT_QUOTES, 'UTF-8') : ''; ?></p>
                                <?php if (!empty($item['date_range'])): ?><p class="item-date"><?= htmlspecialchars((string) $item['date_range'], ENT_QUOTES, 'UTF-8'); ?></p><?php endif; ?>
                                <div class="rich-content"><?= (string) ($item['description_html'] ?? ''); ?></div>
                            </article>
                        <?php endforeach; ?>
                    </div>

                    <div class="profile-section-head">
                        <h2><i class="bi bi-mortarboard"></i> Education</h2>
                        <button type="button" class="section-icon-btn" data-add-item data-section="education"><i class="bi bi-plus-lg"></i></button>
                    </div>
                    <div id="educationList">
                        <?php foreach ($educationItems as $item): ?>
                            <article class="profile-block list-item" data-section="education" data-item-id="<?= htmlspecialchars((string) ($item['item_id'] ?? ''), ENT_QUOTES, 'UTF-8'); ?>">
                                <div class="item-actions">
                                    <button type="button" class="mini-icon-btn" data-edit-item><i class="bi bi-pencil"></i></button>
                                    <button type="button" class="mini-icon-btn" data-remove-item><i class="bi bi-trash"></i></button>
                                </div>
                                <h3><?= htmlspecialchars((string) ($item['title'] ?? ''), ENT_QUOTES, 'UTF-8'); ?></h3>
                                <p class="item-meta"><?= htmlspecialchars((string) ($item['organization'] ?? ''), ENT_QUOTES, 'UTF-8'); ?><?= !empty($item['location']) ? ' • ' . htmlspecialchars((string) $item['location'], ENT_QUOTES, 'UTF-8') : ''; ?></p>
                                <?php if (!empty($item['date_range'])): ?><p class="item-date"><?= htmlspecialchars((string) $item['date_range'], ENT_QUOTES, 'UTF-8'); ?></p><?php endif; ?>
                                <div class="rich-content"><?= (string) ($item['description_html'] ?? ''); ?></div>
                            </article>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="tab-panel" data-panel="resume" id="resumePanel">
                    <?php if ($resumes === []): ?>
                        <div class="profile-block"><p class="empty-copy">No resumes uploaded yet.</p></div>
                    <?php endif; ?>
                    <?php foreach ($resumes as $resume): ?>
                        <?php
                        $resumeId = (int) ($resume['applicant_resume_id'] ?? 0);
                        $fileName = trim((string) ($resume['original_file_name'] ?? ''));
                        if ($fileName === '') {
                            $fileName = trim((string) ($resume['resume_label'] ?? 'Resume'));
                        }
                        $createdUtc = (string) ($resume['created_utc'] ?? '');
                        $addedText = $createdUtc !== '' ? ('Added ' . date('M j, Y', strtotime($createdUtc) ?: time())) : 'Added recently';
                        ?>
                        <article class="resume-item resume-db-item" data-resume-id="<?= $resumeId; ?>">
                            <div class="resume-icon"><i class="bi bi-file-earmark-pdf"></i></div>
                            <div>
                                <h3><?= htmlspecialchars($fileName, ENT_QUOTES, 'UTF-8'); ?></h3>
                                <p><?= htmlspecialchars($addedText, ENT_QUOTES, 'UTF-8'); ?></p>
                            </div>
                            <div class="resume-action-wrap">
                                <button type="button" class="resume-more" data-resume-menu-toggle><i class="bi bi-three-dots"></i></button>
                                <div class="resume-menu">
                                    <button type="button" class="resume-menu-item" data-resume-action="preview"><i class="bi bi-file-earmark-text"></i> Preview</button>
                                    <button type="button" class="resume-menu-item" data-resume-action="download"><i class="bi bi-download"></i> Download</button>
                                    <button type="button" class="resume-menu-item" data-resume-action="sync"><i class="bi bi-arrow-repeat"></i> Sync to profile</button>
                                    <button type="button" class="resume-menu-item" data-resume-action="replace"><i class="bi bi-upload"></i> Upload to replace resume</button>
                                    <button type="button" class="resume-menu-item danger" data-resume-action="delete"><i class="bi bi-trash"></i> Delete</button>
                                </div>
                            </div>
                        </article>
                    <?php endforeach; ?>
                </div>

                <div class="tab-panel" data-panel="preferences">
                    <div class="profile-block"><p class="empty-copy">Preferences section coming next.</p></div>
                </div>
            </div>
        </section>
    </div>
</main>

<div class="modal fade" id="itemEditorModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="itemEditorTitle">Edit item</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="itemIdInput">
                <input type="hidden" id="itemSectionInput">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" id="itemTitleInput" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Company / School</label>
                    <input type="text" id="itemOrgInput" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Location</label>
                    <input type="text" id="itemLocationInput" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Time period</label>
                    <div class="time-period-grid">
                        <div>
                            <label class="form-label tiny-label">Start month</label>
                            <select id="startMonthInput" class="form-select">
                                <option value="">Month</option>
                                <option>January</option><option>February</option><option>March</option><option>April</option>
                                <option>May</option><option>June</option><option>July</option><option>August</option>
                                <option>September</option><option>October</option><option>November</option><option>December</option>
                            </select>
                        </div>
                        <div>
                            <label class="form-label tiny-label">Start year</label>
                            <input type="number" id="startYearInput" class="form-control" min="1950" max="2100" placeholder="Year">
                        </div>
                        <div>
                            <label class="form-label tiny-label">End month</label>
                            <select id="endMonthInput" class="form-select">
                                <option value="">Month</option>
                                <option>January</option><option>February</option><option>March</option><option>April</option>
                                <option>May</option><option>June</option><option>July</option><option>August</option>
                                <option>September</option><option>October</option><option>November</option><option>December</option>
                            </select>
                        </div>
                        <div>
                            <label class="form-label tiny-label">End year</label>
                            <input type="number" id="endYearInput" class="form-control" min="1950" max="2100" placeholder="Year">
                        </div>
                    </div>
                    <div class="form-check mt-2">
                        <input type="checkbox" class="form-check-input" id="isCurrentInput">
                        <label class="form-check-label" for="isCurrentInput" id="isCurrentLabel">I currently work here</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <textarea id="itemDescriptionInput"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="saveItemBtn">Save</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.tiny.cloud/1/<?= htmlspecialchars(rawurlencode($tinyMceKey), ENT_QUOTES, 'UTF-8'); ?>/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
<script>
(() => {
    const accountToggle = document.querySelector('[data-account-toggle]');
    const accountMenu = document.querySelector('[data-account-menu]');
    const logoutBtn = document.querySelector('[data-logout-btn]');
    const summaryEditor = document.getElementById('summaryEditor');
    const summaryBlock = document.getElementById('summaryBlock');
    const tabs = document.querySelectorAll('#profileTabs [data-tab]');
    const panels = document.querySelectorAll('.tab-panel');
    const modalEl = document.getElementById('itemEditorModal');
    const itemModal = modalEl ? new bootstrap.Modal(modalEl) : null;
    const saveItemBtn = document.getElementById('saveItemBtn');
    const months = ['January','February','March','April','May','June','July','August','September','October','November','December'];

    const initTiny = (selector, minHeight = 220) => tinymce.init({
        selector,
        menubar: false,
        plugins: 'lists link',
        toolbar: 'bold italic bullist numlist | link',
        min_height: minHeight,
    });

    initTiny('#summaryTextarea', 200);
    initTiny('#itemDescriptionInput', 240);

    tabs.forEach((tab) => {
        tab.addEventListener('click', () => {
            const tabName = tab.dataset.tab || '';
            tabs.forEach((t) => t.classList.remove('active'));
            tab.classList.add('active');
            panels.forEach((p) => p.classList.remove('active'));
            const panel = document.querySelector(`.tab-panel[data-panel="${tabName}"]`);
            if (panel) panel.classList.add('active');
        });
    });

    if (accountToggle && accountMenu) {
        accountToggle.addEventListener('click', () => accountMenu.classList.toggle('open'));
        document.addEventListener('click', (event) => {
            const clickedInside = event.target instanceof Element && (event.target.closest('[data-account-toggle]') || event.target.closest('[data-account-menu]'));
            if (!clickedInside) accountMenu.classList.remove('open');
        });
    }

    const postProfile = async (payload) => {
        const body = new URLSearchParams(payload);
        const response = await fetch('/profile-content-ajax', {
            method: 'POST',
            headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' },
            body: body.toString(),
        });
        const json = await response.json();
        if (!response.ok || !json.ok) throw new Error(json.message || 'Save failed');
        return json;
    };

    document.querySelector('[data-edit-summary]')?.addEventListener('click', () => {
        summaryEditor.classList.add('open');
    });
    document.querySelector('[data-cancel-summary]')?.addEventListener('click', () => {
        summaryEditor.classList.remove('open');
    });
    document.querySelector('[data-save-summary]')?.addEventListener('click', async () => {
        const html = tinymce.get('summaryTextarea')?.getContent() || '';
        await postProfile({ section: 'summary', action: 'save', summary_html: html });
        window.location.reload();
    });
    document.querySelector('[data-remove-summary]')?.addEventListener('click', async () => {
        await postProfile({ section: 'summary', action: 'remove' });
        window.location.reload();
    });

    document.querySelectorAll('[data-add-item]').forEach((btn) => {
        btn.addEventListener('click', () => {
            document.getElementById('itemIdInput').value = '';
            document.getElementById('itemSectionInput').value = btn.dataset.section || '';
            document.getElementById('itemTitleInput').value = '';
            document.getElementById('itemOrgInput').value = '';
            document.getElementById('itemLocationInput').value = '';
            document.getElementById('startMonthInput').value = '';
            document.getElementById('startYearInput').value = '';
            document.getElementById('endMonthInput').value = '';
            document.getElementById('endYearInput').value = '';
            document.getElementById('isCurrentInput').checked = false;
            tinymce.get('itemDescriptionInput')?.setContent('');
            const isEducation = btn.dataset.section === 'education';
            document.getElementById('itemEditorTitle').textContent = isEducation ? 'Add Education' : 'Add Work Experience';
            document.getElementById('isCurrentLabel').textContent = isEducation ? 'I currently study here' : 'I currently work here';
            itemModal?.show();
        });
    });

    document.querySelectorAll('[data-edit-item]').forEach((btn) => {
        btn.addEventListener('click', () => {
            const card = btn.closest('.list-item');
            if (!card) return;
            document.getElementById('itemIdInput').value = card.dataset.itemId || '';
            document.getElementById('itemSectionInput').value = card.dataset.section || '';
            document.getElementById('itemTitleInput').value = card.querySelector('h3')?.textContent?.trim() || '';
            const meta = card.querySelector('.item-meta')?.textContent?.split('•').map((part) => part.trim()) || [];
            document.getElementById('itemOrgInput').value = meta[0] || '';
            document.getElementById('itemLocationInput').value = meta[1] || '';
            const dateRaw = card.querySelector('.item-date')?.textContent?.trim() || '';
            const [startRaw, endRaw] = dateRaw.split(/\s+to\s+/i);
            const parsePart = (part) => {
                const clean = (part || '').trim();
                if (!clean) return { month: '', year: '' };
                if (/present/i.test(clean)) return { month: '', year: '' };
                const tokens = clean.split(/\s+/);
                const month = months.includes(tokens[0]) ? tokens[0] : '';
                const year = tokens.find((t) => /^\d{4}$/.test(t)) || '';
                return { month, year };
            };
            const start = parsePart(startRaw);
            const end = parsePart(endRaw);
            const isCurrent = /present/i.test(endRaw || '');
            document.getElementById('startMonthInput').value = start.month;
            document.getElementById('startYearInput').value = start.year;
            document.getElementById('endMonthInput').value = isCurrent ? '' : end.month;
            document.getElementById('endYearInput').value = isCurrent ? '' : end.year;
            document.getElementById('isCurrentInput').checked = isCurrent;
            tinymce.get('itemDescriptionInput')?.setContent(card.querySelector('.rich-content')?.innerHTML || '');
            const isEducation = (card.dataset.section || '') === 'education';
            document.getElementById('itemEditorTitle').textContent = isEducation ? 'Edit Education' : 'Edit Work Experience';
            document.getElementById('isCurrentLabel').textContent = isEducation ? 'I currently study here' : 'I currently work here';
            itemModal?.show();
        });
    });

    document.querySelectorAll('[data-remove-item]').forEach((btn) => {
        btn.addEventListener('click', async () => {
            const card = btn.closest('.list-item');
            if (!card) return;
            await postProfile({
                section: card.dataset.section || '',
                action: 'remove',
                item_id: card.dataset.itemId || '',
            });
            window.location.reload();
        });
    });

    document.querySelectorAll('[data-resume-menu-toggle]').forEach((btn) => {
        btn.addEventListener('click', (event) => {
            event.stopPropagation();
            const wrap = btn.closest('.resume-action-wrap');
            if (!wrap) return;
            document.querySelectorAll('.resume-action-wrap.open').forEach((w) => {
                if (w !== wrap) w.classList.remove('open');
            });
            wrap.classList.toggle('open');
        });
    });

    document.addEventListener('click', () => {
        document.querySelectorAll('.resume-action-wrap.open').forEach((w) => w.classList.remove('open'));
    });

    document.querySelectorAll('.resume-menu-item').forEach((btn) => {
        btn.addEventListener('click', async (event) => {
            event.stopPropagation();
            const action = btn.dataset.resumeAction || '';
            const card = btn.closest('.resume-db-item');
            if (!card) return;
            const resumeId = card.dataset.resumeId || '';

            if (action === 'delete') {
                await fetch('/profile-resume-ajax', {
                    method: 'POST',
                    headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' },
                    body: new URLSearchParams({ action: 'delete', resume_id: resumeId }).toString(),
                });
                window.location.reload();
                return;
            }

            const textMap = {
                preview: 'Preview action is ready for wiring to your file viewer.',
                download: 'Download action is ready for wiring to your file download endpoint.',
                sync: 'Sync to profile action can be wired next.',
                replace: 'Upload to replace resume action can be wired next.',
            };
            alert(textMap[action] || 'Action coming next.');
        });
    });

    saveItemBtn?.addEventListener('click', async () => {
        const startMonth = document.getElementById('startMonthInput').value.trim();
        const startYear = document.getElementById('startYearInput').value.trim();
        const endMonth = document.getElementById('endMonthInput').value.trim();
        const endYear = document.getElementById('endYearInput').value.trim();
        const isCurrent = document.getElementById('isCurrentInput').checked;
        const startPart = [startMonth, startYear].filter(Boolean).join(' ').trim();
        const endPart = isCurrent ? 'Present' : [endMonth, endYear].filter(Boolean).join(' ').trim();
        const dateRange = startPart && endPart ? `${startPart} to ${endPart}` : (startPart || endPart);

        await postProfile({
            section: document.getElementById('itemSectionInput').value,
            action: 'save',
            item_id: document.getElementById('itemIdInput').value,
            title: document.getElementById('itemTitleInput').value,
            organization: document.getElementById('itemOrgInput').value,
            location: document.getElementById('itemLocationInput').value,
            date_range: dateRange,
            start_month: startMonth,
            start_year: startYear,
            end_month: isCurrent ? '' : endMonth,
            end_year: isCurrent ? '' : endYear,
            is_current: isCurrent ? '1' : '0',
            description_html: tinymce.get('itemDescriptionInput')?.getContent() || '',
        });
        itemModal?.hide();
        window.location.reload();
    });

    if (logoutBtn) {
        logoutBtn.addEventListener('click', async () => {
            logoutBtn.disabled = true;
            try {
                const response = await fetch('/logout-ajax', { method: 'POST', headers: { 'X-Requested-With': 'XMLHttpRequest' } });
                const payload = await response.json();
                window.location.href = payload.redirect || '/';
            } catch (e) {
                window.location.href = '/';
            }
        });
    }
})();
</script>
