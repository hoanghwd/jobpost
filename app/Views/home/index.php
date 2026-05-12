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
$isLoggedIn = !empty($_SESSION['auth']['is_logged_in']);
$displayName = trim((string) ($_SESSION['auth']['applicant']['first_name'] ?? ''));
$displayNameFull = trim((string) ($_SESSION['auth']['applicant']['full_name'] ?? ''));
$avatarLetter = strtoupper(substr($displayName !== '' ? $displayName : ((string) ($_SESSION['auth']['applicant']['username'] ?? 'A')), 0, 1));
if ($avatarLetter === '') {
    $avatarLetter = 'A';
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
                    <?php if ($isLoggedIn): ?>
                        <div class="candidate-nav-icons" aria-label="Candidate quick actions">
                            <a href="#" class="candidate-icon-btn" title="Saved jobs" aria-label="Saved jobs"><i class="bi bi-bookmark"></i></a>
                            <a href="#" class="candidate-icon-btn" title="Messages" aria-label="Messages"><i class="bi bi-chat-left-text"></i></a>
                            <a href="#" class="candidate-icon-btn has-badge" title="Notifications" aria-label="Notifications">
                                <i class="bi bi-bell"></i>
                                <span class="candidate-count-badge">9+</span>
                            </a>
                            <div class="candidate-account-wrap">
                                <button type="button" class="candidate-profile-btn" title="Account" aria-label="Account" data-account-toggle>
                                    <span class="candidate-avatar"><?= htmlspecialchars($avatarLetter, ENT_QUOTES, 'UTF-8'); ?></span>
                                </button>
                                <div class="candidate-account-menu" data-account-menu>
                                    <div class="candidate-account-name"><?= htmlspecialchars($displayNameFull !== '' ? $displayNameFull : 'Candidate', ENT_QUOTES, 'UTF-8'); ?></div>
                                    <a href="#" class="candidate-account-item">Profile</a>
                                    <button type="button" class="candidate-account-item logout-btn" data-logout-btn>Log out</button>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        <a href="/login" class="top-link">Login</a>
                    <?php endif; ?>
                    <span class="top-sep">|</span>
                    <a href="https://jobportal.huynhdous.com/login" class="top-link">Employers / Post Job</a>
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
                    $workModeRaw = trim((string) ($job['work_mode'] ?? ''));
                    $workModeLabel = '';
                    if ($workModeRaw !== '') {
                        $workModeLabel = str_replace('_', ' ', strtolower($workModeRaw));
                        if ($workModeLabel === 'full time' || $workModeLabel === 'part time') {
                            $workModeLabel = ucwords($workModeLabel);
                            $workModeLabel = str_replace(' ', '-', $workModeLabel);
                        } else {
                            $workModeLabel = ucwords($workModeLabel);
                        }
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
                        <?php if ($cardPay !== '' || $workModeLabel !== ''): ?>
                            <div class="meta-snippets">
                                <?php if ($cardPay !== ''): ?>
                                    <p class="pay-snippet"><?= htmlspecialchars($cardPay, ENT_QUOTES, 'UTF-8'); ?></p>
                                <?php endif; ?>
                                <?php if ($workModeLabel !== ''): ?>
                                    <span class="worktype-snippet"><?= htmlspecialchars($workModeLabel, ENT_QUOTES, 'UTF-8'); ?></span>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>
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
    const accountToggle = document.querySelector('[data-account-toggle]');
    const accountMenu = document.querySelector('[data-account-menu]');
    const logoutBtn = document.querySelector('[data-logout-btn]');

    if (accountToggle && accountMenu) {
        accountToggle.addEventListener('click', () => {
            accountMenu.classList.toggle('open');
        });

        document.addEventListener('click', (event) => {
            const clickedInside = event.target instanceof Element && (event.target.closest('[data-account-toggle]') || event.target.closest('[data-account-menu]'));
            if (!clickedInside) {
                accountMenu.classList.remove('open');
            }
        });
    }

    if (logoutBtn) {
        logoutBtn.addEventListener('click', async () => {
            logoutBtn.disabled = true;
            try {
                const response = await fetch('/logout-ajax', {
                    method: 'POST',
                    headers: { 'X-Requested-With': 'XMLHttpRequest' },
                });
                if (!response.ok) {
                    window.location.href = '/';
                    return;
                }
                const payload = await response.json();
                window.location.href = payload.redirect || '/';
            } catch (e) {
                window.location.href = '/';
            }
        });
    }

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
