<?php declare(strict_types=1); ?>
<?php if ($selectedJob === null): ?>
    <div class="empty-detail">
        <h3>Select a job</h3>
        <p>Open a job on the left to view full details.</p>
    </div>
<?php else: ?>
    <?php
    $detailTitle = (string) ($selectedJob['job_title'] ?? 'Untitled Job');
    $detailCompany = (string) ($selectedJob['company_name'] ?? 'Unknown Company');
    $detailLocation = trim((string) ($selectedJob['job_location'] ?: (($selectedJob['city'] ?? '') . ', ' . ($selectedJob['state_code'] ?? ''))));
    $descriptionRaw = (string) ($selectedJob['description_text'] ?? '');
    ?>
    <header class="detail-head">
        <h1><?= htmlspecialchars($detailTitle, ENT_QUOTES, 'UTF-8'); ?></h1>
        <p class="company-line"><?= htmlspecialchars($detailCompany, ENT_QUOTES, 'UTF-8'); ?> | <?= htmlspecialchars($detailLocation !== '' ? $detailLocation : 'Location not specified', ENT_QUOTES, 'UTF-8'); ?></p>
        <div class="detail-actions">
            <a href="#" class="apply-btn">Apply with JobPost</a>
            <button type="button" class="icon-btn"><i class="bi bi-bookmark"></i></button>
            <button type="button" class="icon-btn"><i class="bi bi-share"></i></button>
        </div>
    </header>
    <article class="detail-body">
        <h2>Full job description</h2>
        <?php if (trim($descriptionRaw) === ''): ?>
            <p>This job does not have a description yet.</p>
        <?php else: ?>
            <div class="job-description"><?= nl2br(htmlspecialchars($descriptionRaw, ENT_QUOTES, 'UTF-8')); ?></div>
        <?php endif; ?>
    </article>
<?php endif; ?>
