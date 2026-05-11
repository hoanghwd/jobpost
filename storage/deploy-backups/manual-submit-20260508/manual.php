<?php
$jobBoardOptions = is_array($jobBoardOptions ?? null) ? $jobBoardOptions : [];
$totalJobBoardCount = isset($totalJobBoardCount) ? (int) $totalJobBoardCount : count($jobBoardOptions);
$h = static fn ($value): string => htmlspecialchars((string) ($value ?? ''), ENT_QUOTES, 'UTF-8');
?>
<div class="container-fluid px-0 manual-applicant-page">
    <div class="manual-title-row">
        <h1>New Applicant</h1>
    </div>

    <form id="manualApplicantForm" class="manual-form" method="post" action="/process-applicants/manual/store" enctype="multipart/form-data" novalidate>
        <input type="hidden" name="selected_account_id" id="manualSelectedAccountId" value="">
        <div class="manual-board-strip">
            <span><strong><?= count($jobBoardOptions) ?></strong> My Saved Job Boards</span>
            <span><strong><?= $totalJobBoardCount ?></strong> Total Job Boards</span>
            <a href="/office/settings">Job Board Preferences</a>
        </div>

        <div class="manual-panel">
            <div class="manual-alert d-none" id="manualApplicantAlert"></div>

            <div class="manual-field">
                <label for="manualJobBoard">Job Board <span>*</span></label>
                <select id="manualJobBoard" name="job_board_id" class="form-select" required>
                    <option value="">-- Select a Job Board --</option>
                    <?php foreach ($jobBoardOptions as $option): ?>
                        <?php $jobBoardId = (int) ($option['job_board_id'] ?? 0); ?>
                        <?php if ($jobBoardId > 0): ?>
                            <option value="<?= $jobBoardId ?>"><?= $h($option['job_board_name'] ?? ('Job Board #' . $jobBoardId)) ?></option>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="manual-field">
                <label for="manualJobPost">Job <span>*</span></label>
                <select id="manualJobPost" name="job_post_id" class="form-select" required>
                    <option value="">-- Select a Job Board First --</option>
                </select>
            </div>

            <div class="manual-field">
                <label for="manualFirstName">First Name <span>*</span></label>
                <input id="manualFirstName" name="first_name" type="text" class="form-control" placeholder="Enter First Name" required>
            </div>

            <div class="manual-field">
                <label for="manualLastName">Last Name <span>*</span></label>
                <input id="manualLastName" name="last_name" type="text" class="form-control" placeholder="Enter Last Name" required>
            </div>

            <div class="manual-field">
                <label for="manualPhone">Phone <span>*</span></label>
                <input id="manualPhone" name="phone" type="tel" class="form-control" inputmode="numeric" autocomplete="tel" maxlength="12" placeholder="123 456 7680" pattern="[0-9 ]{12}" title="Enter 10 digits, like 123 456 7680" required>
            </div>

            <div class="manual-field">
                <label for="manualEmail">Email Address <span>*</span></label>
                <input id="manualEmail" name="email" type="email" class="form-control" placeholder="Enter email address" required>
            </div>

            <div class="manual-field manual-duplicate-row">
                <div></div>
                <div>
                    <button type="button" class="btn btn-dark btn-sm" id="manualDuplicateCheck">Check for Duplicates</button>
                    <div class="manual-duplicate-result" id="manualDuplicateResult"></div>
                </div>
            </div>

            <div class="manual-field">
                <label for="manualNotes">Notes</label>
                <textarea id="manualNotes" name="notes" class="form-control" rows="3"></textarea>
            </div>

            <div class="manual-field manual-upload-field">
                <label>Resume Upload</label>
                <div class="manual-drop-zone" id="manualResumeDropZone">
                    <input type="file" id="manualResume" name="resume" accept=".pdf,.doc,.docx,.txt,.rtf,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,text/plain,application/rtf">
                    <div class="manual-drop-icon">&uarr;</div>
                    <strong>Drag and drop resume here</strong>
                    <span>or click to choose PDF, DOC, DOCX, TXT, or RTF</span>
                    <small id="manualResumeFileName">No file selected</small>
                    <div id="manualResumePreview" class="manual-resume-preview is-empty" aria-live="polite"></div>
                </div>
                <div id="manualResumeError" class="manual-resume-error d-none" aria-live="polite"></div>
            </div>
        </div>

        <div class="manual-actions">
            <button type="submit" class="btn btn-primary" data-next="stay">Save Applicant</button>
            <!--
            <button type="submit" class="btn btn-outline-primary" data-next="list">Save &amp; View in Call List</button>
            --->
        </div>
    </form>
</div>

<link rel="stylesheet" href="/assets/css/process_manual.css">
<script src="/assets/js/process_manual.js?v=20260508-submit"></script>
