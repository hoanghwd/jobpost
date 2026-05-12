<?php declare(strict_types=1); ?>
<?php
$jobs = $jobs ?? [];
$selectedJob = $selectedJob ?? null;
$keyword = $keyword ?? '';
$location = $location ?? '';
$currentPath = parse_url((string) ($_SERVER['REQUEST_URI'] ?? '/'), PHP_URL_PATH) ?: '/';
$currentTab = (string) ($_GET['tab'] ?? '');
$jobCount = count($jobs);
$hasFilters = $keyword !== '' || $location !== '';
$jobsLabel = $jobCount === 1 ? 'job' : 'jobs';
$resultsSummary = $hasFilters
    ? sprintf('%d %s match your criteria', $jobCount, $jobsLabel)
    : sprintf('%d active %s in the last 3 months', $jobCount, $jobsLabel);

$activeTab = 'home';
if ($currentPath === '/company-reviews' || $currentTab === 'company-reviews') {
    $activeTab = 'company-reviews';
} elseif ($currentPath === '/find-salaries' || $currentTab === 'find-salaries') {
    $activeTab = 'find-salaries';
}
?>

<main class="indeed-page">
    <div class="indeed-shell">
        <header class="site-header">
            <div class="hero-nav">
                <div class="hero-nav-left">
                    <div class="brand">JobPost</div>
                    <nav>
                        <a href="/?tab=home" class="<?= $activeTab === 'home' ? 'active' : ''; ?>">Home</a>
                        <a href="/?tab=company-reviews" class="<?= $activeTab === 'company-reviews' ? 'active' : ''; ?>">Company reviews</a>
                        <a href="/?tab=find-salaries" class="<?= $activeTab === 'find-salaries' ? 'active' : ''; ?>">Find salaries</a>
                    </nav>
                </div>
                <div class="hero-nav-right">
                    <a href="/login" class="top-link">Login</a>
                    <span class="top-sep">|</span>
                    <a href="https://jobportal.huynhdous.com/login" class="top-link">Recruiters/Post Job</a>
                </div>
            </div>
        </header>
        <hr class="header-divider">

        <section class="home-hero">
            <form class="search-bar" method="get" action="/">
                <div class="search-field">
                    <i class="bi bi-search"></i>
                    <input type="text" name="q" value="<?= htmlspecialchars((string) $keyword, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Job title or keyword">
                </div>
                <div class="search-field">
                    <i class="bi bi-geo-alt"></i>
                    <input type="text" name="l" value="<?= htmlspecialchars((string) $location, ENT_QUOTES, 'UTF-8'); ?>" placeholder="City, state, or remote">
                </div>
                <button type="submit" class="search-btn">Find jobs</button>
            </form>
        </section>
        <div class="search-divider-wrap">
            <hr class="search-divider">
        </div>

        <div class="jobs-grid">
            <section class="job-list">
                <h2>Matches your preferences</h2>
                <p class="results-summary"><?= htmlspecialchars($resultsSummary, ENT_QUOTES, 'UTF-8'); ?></p>
                <?php if ($jobs === []): ?>
                    <div class="job-card empty-state">
                        <p>No active jobs found for this search.</p>
                    </div>
                <?php endif; ?>

                <?php foreach ($jobs as $job): ?>
                    <?php
                    $jobId = (int) ($job['job_post_id'] ?? 0);
                    $isActive = $selectedJob !== null && (int) ($selectedJob['job_post_id'] ?? 0) === $jobId;
                    $query = http_build_query([
                        'q' => $keyword,
                        'l' => $location,
                        'job' => $jobId,
                    ]);
                    $titleText = (string) ($job['job_title'] ?? 'Untitled Job');
                    $titleWithId = $titleText . ' (#' . $jobId . ')';
                    $companyText = (string) ($job['company_name'] ?? 'Unknown Company');
                    $locationText = trim((string) ($job['job_location'] ?: (($job['city'] ?? '') . ', ' . ($job['state_code'] ?? ''))));
                    $summary = '';
                    $benefitsRaw = (string) ($job['benefits'] ?? '');
                    if (trim($benefitsRaw) !== '') {
                        $benefitHighlights = [];
                        if (preg_match_all('/<li\b[^>]*>(.*?)<\/li>/is', $benefitsRaw, $benefitMatches)) {
                            foreach ($benefitMatches[1] as $benefitItem) {
                                $plain = trim((string) (preg_replace('/\s+/', ' ', strip_tags((string) $benefitItem)) ?? ''));
                                $plain = html_entity_decode($plain, ENT_QUOTES | ENT_HTML5, 'UTF-8');
                                if ($plain !== '') {
                                    $benefitHighlights[] = $plain;
                                }
                                if (count($benefitHighlights) >= 2) {
                                    break;
                                }
                            }
                        }

                        if ($benefitHighlights !== []) {
                            $summary = implode(' • ', $benefitHighlights);
                        } else {
                            $summary = substr((string) (preg_replace('/\s+/', ' ', strip_tags($benefitsRaw)) ?? ''), 0, 160);
                            $summary = html_entity_decode($summary, ENT_QUOTES | ENT_HTML5, 'UTF-8');
                        }
                    }

                    if ($summary === '') {
                        $summary = trim((string) ($job['description_text'] ?? ''));
                        $summary = substr((string) (preg_replace('/\s+/', ' ', strip_tags($summary)) ?? ''), 0, 160);
                        $summary = html_entity_decode($summary, ENT_QUOTES | ENT_HTML5, 'UTF-8');
                    }
                    $payMin = isset($job['pay_rate_min']) ? (float) $job['pay_rate_min'] : null;
                    $payMax = isset($job['pay_rate_max']) ? (float) $job['pay_rate_max'] : null;
                    $payIntervalRaw = strtolower(trim((string) ($job['pay_interval'] ?? '')));
                    $paySuffix = $payIntervalRaw === 'salary' ? 'a year' : ($payIntervalRaw === 'hourly' ? 'an hour' : '');
                    $formatMoney = static fn (float $amount): string => '$' . number_format($amount, 2);
                    $cardPay = '';
                    if ($payMin !== null && $payMax !== null && $payMin > 0 && $payMax > 0) {
                        $cardPay = $formatMoney(min($payMin, $payMax)) . ' - ' . $formatMoney(max($payMin, $payMax));
                    } elseif ($payMin !== null && $payMin > 0) {
                        $cardPay = 'From ' . $formatMoney($payMin);
                    } elseif ($payMax !== null && $payMax > 0) {
                        $cardPay = 'Up to ' . $formatMoney($payMax);
                    }
                    if ($cardPay !== '' && $paySuffix !== '') {
                        $cardPay .= ' ' . $paySuffix;
                    }
                    ?>
                    <a
                        class="job-card<?= $isActive ? ' selected' : ''; ?>"
                        href="/?<?= htmlspecialchars($query, ENT_QUOTES, 'UTF-8'); ?>"
                        data-job-card
                        data-job-id="<?= $jobId; ?>"
                    >
                        <h3><?= htmlspecialchars($titleWithId, ENT_QUOTES, 'UTF-8'); ?></h3>
                        <p class="company"><?= htmlspecialchars($companyText, ENT_QUOTES, 'UTF-8'); ?></p>
                        <p class="location"><i class="bi bi-geo-alt-fill"></i> <?= htmlspecialchars($locationText !== '' ? $locationText : 'Location not specified', ENT_QUOTES, 'UTF-8'); ?></p>
                        <?php if ($cardPay !== ''): ?>
                            <p class="pay-snippet"><?= htmlspecialchars($cardPay, ENT_QUOTES, 'UTF-8'); ?></p>
                        <?php endif; ?>
                        <div class="tags">
                            <span><?= htmlspecialchars((string) ($job['channel_type'] ?? 'General'), ENT_QUOTES, 'UTF-8'); ?></span>
                            <span><?= htmlspecialchars((string) ($job['workflow_type'] ?? 'standard'), ENT_QUOTES, 'UTF-8'); ?></span>
                        </div>
                        <?php if ($summary !== ''): ?>
                            <p class="summary"><?= htmlspecialchars($summary, ENT_QUOTES, 'UTF-8'); ?>...</p>
                        <?php endif; ?>
                    </a>
                <?php endforeach; ?>
            </section>

            <section class="job-detail" id="job-detail-panel">
                <?php require base_path('app/Views/home/_job_detail.php'); ?>
            </section>
        </div>
    </div>
</main>

<script>
(() => {
    const cards = document.querySelectorAll('[data-job-card]');
    const detailPanel = document.getElementById('job-detail-panel');
    if (!cards.length || !detailPanel) return;

    const setSelected = (targetCard) => {
        cards.forEach((card) => card.classList.remove('selected'));
        targetCard.classList.add('selected');
    };

    const updateUrl = (card) => {
        const url = new URL(window.location.href);
        url.searchParams.set('job', card.dataset.jobId || '');
        history.replaceState({}, '', url.toString());
    };

    cards.forEach((card) => {
        card.addEventListener('click', async (event) => {
            event.preventDefault();
            const jobId = card.dataset.jobId;
            if (!jobId) return;

            try {
                const response = await fetch(`/?ajax=job_detail&job=${encodeURIComponent(jobId)}`, { headers: { 'X-Requested-With': 'XMLHttpRequest' } });
                if (!response.ok) return;
                const html = await response.text();
                detailPanel.innerHTML = html;
                setSelected(card);
                updateUrl(card);
                detailPanel.scrollTop = 0;
            } catch (e) {
                window.location.href = card.getAttribute('href') || '/';
            }
        });
    });
})();
</script>
