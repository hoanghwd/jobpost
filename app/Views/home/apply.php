<?php declare(strict_types=1); ?>
<?php
$applicant = $applicant ?? [];
$job = $job ?? [];
$resume = $resume ?? null;
$fullName = trim((string) (($applicant['first_name'] ?? '') . ' ' . ($applicant['last_name'] ?? '')));
$email = trim((string) ($applicant['email'] ?? ''));
$phone = trim((string) ($applicant['phone'] ?? ''));
$phoneDigits = preg_replace('/\D+/', '', $phone) ?? '';
if (strlen($phoneDigits) === 11 && str_starts_with($phoneDigits, '1')) {
    $phoneDigits = substr($phoneDigits, 1);
}
if (strlen($phoneDigits) === 10) {
    $phone = sprintf('+1 %s %s %s', substr($phoneDigits, 0, 3), substr($phoneDigits, 3, 3), substr($phoneDigits, 6, 4));
}
$location = trim((string) (($job['city'] ?? '') . ', ' . ($job['state_code'] ?? '')));
$resumeName = trim((string) ($resume['original_file_name'] ?? ''));
$recentlyApplied = !empty($recentlyApplied);
if ($resumeName === '') {
    $resumeName = trim((string) ($resume['resume_label'] ?? 'No resume selected'));
}
$resumeId = (int) ($resume['applicant_resume_id'] ?? 0);
$resumePreviewUrl = $resumeId > 0 ? '/resume-file?resume_id=' . $resumeId . '&mode=inline' : '';
$resumeDownloadUrl = $resumeId > 0 ? '/resume-file?resume_id=' . $resumeId . '&mode=download' : '';
$displayName = trim((string) ($applicant['first_name'] ?? ''));
$avatarLetter = strtoupper(substr($displayName !== '' ? $displayName : ((string) ($applicant['username'] ?? 'A')), 0, 1));
if ($avatarLetter === '') {
    $avatarLetter = 'A';
}
?>

<main class="apply-page">
    <div class="indeed-shell">
        <header class="site-header">
            <div class="hero-nav">
                <div class="hero-nav-left">
                    <div class="brand">JobPost</div>
                    <nav>
                        <a href="/?tab=home" class="active">Home</a>
                        <a href="/?tab=company-reviews">Company reviews</a>
                        <a href="/?tab=find-salaries">Find salaries</a>
                    </nav>
                </div>
                <div class="hero-nav-right">
                    <div class="candidate-nav-icons" aria-label="Candidate quick actions">
                        <a href="#" class="candidate-icon-btn" title="Saved jobs" aria-label="Saved jobs"><i class="bi bi-bookmark"></i></a>
                        <a href="#" class="candidate-icon-btn" title="Messages" aria-label="Messages"><i class="bi bi-chat-left-text"></i></a>
                        <a href="#" class="candidate-icon-btn has-badge" title="Notifications" aria-label="Notifications">
                            <i class="bi bi-bell"></i>
                            <span class="candidate-count-badge">9+</span>
                        </a>
                        <a href="/profile" class="candidate-profile-btn" title="Account" aria-label="Account">
                            <span class="candidate-avatar"><?= htmlspecialchars($avatarLetter, ENT_QUOTES, 'UTF-8'); ?></span>
                        </a>
                    </div>
                    <span class="top-sep">|</span>
                    <a href="https://jobportal.huynhdous.com/login" class="top-link">Employers / Post Job</a>
                </div>
            </div>
        </header>
    </div>
    <hr class="apply-main-divider">

    <div class="apply-shell">
        <section class="apply-loading-card" id="applyLoadingCard">
            <h2>Loading your profile</h2>
            <div class="apply-progress">
                <div class="apply-progress-track">
                    <div class="apply-progress-bar" id="applyLoadingBar"></div>
                </div>
                <span id="applyLoadingPct">0%</span>
            </div>
        </section>

        <div id="applyContentRoot" style="display:none;">
            <section class="apply-job-card">
                <h1><?= htmlspecialchars((string) ($job['job_title'] ?? 'Job'), ENT_QUOTES, 'UTF-8'); ?></h1>
                <?php
                $companyName = trim((string) ($job['company_name'] ?? ''));
                $jobMeta = trim(implode(' - ', array_filter([
                    $companyName,
                    $location,
                ], static fn (string $part): bool => trim($part) !== '')));
                ?>
                <?php if ($jobMeta !== ''): ?>
                    <p><?= htmlspecialchars($jobMeta, ENT_QUOTES, 'UTF-8'); ?></p>
                <?php endif; ?>
            </section>

            <section class="apply-review-card" id="applyReviewCard">
                <div class="apply-progress">
                    <div class="apply-progress-track">
                        <div class="apply-progress-bar" style="width:100%;"></div>
                    </div>
                    <span>100%</span>
                </div>
                <h2>Please review your application</h2>
                <p>You will not be able to make changes after you submit your application.</p>

                <div class="apply-detail-card">
                    <h3>Contact information</h3>
                    <div class="row"><label>Full name</label><strong><?= htmlspecialchars($fullName, ENT_QUOTES, 'UTF-8'); ?></strong></div>
                    <div class="row"><label>Email</label><strong><?= htmlspecialchars($email, ENT_QUOTES, 'UTF-8'); ?></strong></div>
                    <div class="row"><label>Phone number</label><strong><?= htmlspecialchars($phone, ENT_QUOTES, 'UTF-8'); ?></strong></div>
                </div>

                <div class="apply-detail-card">
                    <div class="apply-resume-head">
                        <h3>Resume</h3>
                        <?php if ($resumeDownloadUrl !== ''): ?>
                            <a href="<?= htmlspecialchars($resumeDownloadUrl, ENT_QUOTES, 'UTF-8'); ?>" class="apply-resume-link">Download</a>
                        <?php endif; ?>
                    </div>
                    <div class="apply-resume-file">
                        <img src="/assets/images/PDF_file_icon.svg" alt="PDF file icon">
                        <div>
                            <strong><?= htmlspecialchars($resumeName, ENT_QUOTES, 'UTF-8'); ?></strong>
                            <p>Uploaded and ready</p>
                        </div>
                    </div>
                    <?php if ($resumePreviewUrl !== ''): ?>
                        <div class="apply-resume-preview">
                            <iframe src="<?= htmlspecialchars($resumePreviewUrl, ENT_QUOTES, 'UTF-8'); ?>" title="Resume preview" scrolling="no"></iframe>
                        </div>
                    <?php endif; ?>
                </div>

                <?php if ($recentlyApplied): ?>
                    <p class="apply-blocked-msg">You already applied to this job. You can apply again after 3 months if the job is still active.</p>
                <?php endif; ?>
                <button
                    type="button"
                    class="submit-application-btn"
                    id="submitApplicationBtn"
                    data-job-id="<?= (int) ($job['job_post_id'] ?? 0); ?>"
                    <?= $recentlyApplied ? 'disabled' : ''; ?>
                >Submit your application</button>
            </section>

            <section class="apply-success-card" id="applySuccessCard" style="display:none;">
                <h2>Application submitted</h2>
                <p>Confirmed. Your candidate application was submitted successfully.</p>
                <a href="/" class="back-home-btn">Back to jobs</a>
            </section>
        </div>
    </div>
</main>

<script>
(() => {
    const loadingCard = document.getElementById('applyLoadingCard');
    const contentRoot = document.getElementById('applyContentRoot');
    const loadingBar = document.getElementById('applyLoadingBar');
    const loadingPct = document.getElementById('applyLoadingPct');
    const submitBtn = document.getElementById('submitApplicationBtn');
    const reviewCard = document.getElementById('applyReviewCard');
    const successCard = document.getElementById('applySuccessCard');
    if (!loadingCard || !contentRoot || !loadingBar || !loadingPct) return;

    let progress = 0;
    const timer = setInterval(() => {
        progress += progress < 70 ? 3 : (progress < 90 ? 2 : 1);
        if (progress > 100) progress = 100;
        loadingBar.style.width = progress + '%';
        loadingPct.textContent = progress + '%';

        if (progress >= 100) {
            clearInterval(timer);
            setTimeout(() => {
                loadingCard.style.display = 'none';
                contentRoot.style.display = 'block';
            }, 180);
        }
    }, 24);

    if (!submitBtn) return;
    if (submitBtn.disabled) return;

    submitBtn.addEventListener('click', async () => {
        const jobId = submitBtn.getAttribute('data-job-id') || '';
        if (!jobId) return;
        submitBtn.disabled = true;
        submitBtn.textContent = 'Submitting...';
        try {
            const response = await fetch('/apply-ajax', {
                method: 'POST',
                headers: { 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' },
                body: new URLSearchParams({ job_id: jobId }).toString(),
            });
            const payload = await response.json();
            if (!response.ok || !payload.ok) {
                throw new Error(payload.message || 'Submit failed');
            }
            reviewCard.style.display = 'none';
            successCard.style.display = 'block';
        } catch (e) {
            alert('Unable to submit application. Please try again.');
            submitBtn.disabled = false;
            submitBtn.textContent = 'Submit your application';
        }
    });
})();
</script>
