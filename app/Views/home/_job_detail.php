<?php declare(strict_types=1); ?>
<?php if ($selectedJob === null): ?>
    <div class="empty-detail">
        <h3>Select a job</h3>
        <p>Open a job on the left to view full details.</p>
    </div>
<?php else: ?>
    <?php
    $detailTitle = (string) ($selectedJob['job_title'] ?? 'Untitled Job');
    $detailJobId = (int) ($selectedJob['job_post_id'] ?? 0);
    $detailTitleWithId = $detailTitle . ' (#' . $detailJobId . ')';
    $detailCompany = (string) ($selectedJob['company_name'] ?? 'Unknown Company');
    $detailLocation = trim((string) ($selectedJob['job_location'] ?: (($selectedJob['city'] ?? '') . ', ' . ($selectedJob['state_code'] ?? ''))));
    $payMin = isset($selectedJob['pay_rate_min']) ? (float) $selectedJob['pay_rate_min'] : null;
    $payMax = isset($selectedJob['pay_rate_max']) ? (float) $selectedJob['pay_rate_max'] : null;
    $payIntervalRaw = strtolower(trim((string) ($selectedJob['pay_interval'] ?? '')));
    $paySuffix = $payIntervalRaw === 'salary' ? 'a year' : ($payIntervalRaw === 'hourly' ? 'an hour' : '');
    $formatMoney = static fn (float $amount): string => '$' . number_format($amount, 2);
    $payText = '';
    if ($payMin !== null && $payMax !== null && $payMin > 0 && $payMax > 0) {
        $payText = $formatMoney(min($payMin, $payMax)) . ' - ' . $formatMoney(max($payMin, $payMax));
    } elseif ($payMin !== null && $payMin > 0) {
        $payText = 'From ' . $formatMoney($payMin);
    } elseif ($payMax !== null && $payMax > 0) {
        $payText = 'Up to ' . $formatMoney($payMax);
    }
    if ($payText !== '' && $paySuffix !== '') {
        $payText .= ' ' . $paySuffix;
    }
    $workModeRaw = trim((string) ($selectedJob['work_mode'] ?? ''));
    $workTypeTokens = array_values(array_filter(array_map('trim', preg_split('/[,\|\/]+/', $workModeRaw ?: '') ?: [])));
    $workTypeLabels = [];
    foreach ($workTypeTokens as $token) {
        $normalized = str_replace('_', ' ', strtolower($token));
        if ($normalized === 'full time' || $normalized === 'part time') {
            $label = ucwords($normalized);
            $label = str_replace(' ', '-', $label);
        } else {
            $label = ucwords($normalized);
        }
        if ($label !== '') {
            $workTypeLabels[] = $label;
        }
    }
    $descriptionParts = [
        (string) ($selectedJob['description_text'] ?? ''),
        (string) ($selectedJob['qualifications'] ?? ''),
        (string) ($selectedJob['benefits'] ?? ''),
    ];
    $descriptionParts = array_values(array_filter($descriptionParts, static fn (string $part): bool => trim($part) !== ''));
    $descriptionRaw = implode("\n\n", $descriptionParts);
    $descriptionHtml = preg_replace('/<script\b[^>]*>(.*?)<\/script>/is', '', $descriptionRaw) ?? '';
    ?>
    <header class="detail-head">
        <h1><?= htmlspecialchars($detailTitleWithId, ENT_QUOTES, 'UTF-8'); ?></h1>
        <p class="company-line"><?= htmlspecialchars($detailCompany, ENT_QUOTES, 'UTF-8'); ?> | <?= htmlspecialchars($detailLocation !== '' ? $detailLocation : 'Location not specified', ENT_QUOTES, 'UTF-8'); ?></p>
        <?php if ($payText !== ''): ?>
            <section class="pay-panel" aria-label="Pay">
                <p class="pay-kicker">Pay</p>
                <p class="pay-value"><?= htmlspecialchars($payText, ENT_QUOTES, 'UTF-8'); ?></p>
            </section>
        <?php endif; ?>
        <div class="detail-actions">
            <a href="#" class="apply-btn">Apply with JobPost</a>
            <button type="button" class="icon-btn"><i class="bi bi-bookmark"></i></button>
            <button type="button" class="icon-btn"><i class="bi bi-share"></i></button>
        </div>
    </header>
    <article class="detail-body">
        <?php if ($workTypeLabels !== []): ?>
            <section class="job-details-panel" aria-label="Job details">
                <h2>Job details</h2>
                <div class="job-type-row">
                    <p class="job-type-title"><i class="bi bi-briefcase"></i> Job type</p>
                    <div class="job-type-chips">
                        <?php foreach ($workTypeLabels as $workTypeLabel): ?>
                            <span class="job-type-chip"><?= htmlspecialchars($workTypeLabel, ENT_QUOTES, 'UTF-8'); ?></span>
                        <?php endforeach; ?>
                    </div>
                </div>
            </section>
        <?php endif; ?>
        <?php if (trim($descriptionRaw) === ''): ?>
            <p>This job does not have a description yet.</p>
        <?php else: ?>
            <div class="job-description"><?= $descriptionHtml; ?></div>
        <?php endif; ?>
    </article>
<?php endif; ?>
