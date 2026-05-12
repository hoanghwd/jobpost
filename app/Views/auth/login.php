<?php
declare(strict_types=1);
?>
<style>
    /* Login page uses viewport-aware sizing so 100% browser zoom fits normal laptop screens. */
    html:has(.login-shell),
    body:has(.login-shell) {
        height: 100%;
        overflow: hidden;
    }

    .jp-public-shell:has(.login-shell) {
        height: calc(100svh - 104px);
        max-height: calc(100svh - 104px);
        margin-top: 104px;
        padding-top: clamp(8px, 2vh, 18px);
        padding-bottom: clamp(8px, 2vh, 18px);
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .login-shell {
        width: 100%;
        height: 100%;
        min-height: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0;
    }

    .login-split-card {
        width: min(1120px, 100%);
        height: min(100%, clamp(500px, calc(100svh - 150px), 660px));
        max-height: 100%;
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        box-shadow: 0 30px 90px rgba(15, 23, 42, .12);
        overflow: hidden;
        display: grid;
        grid-template-columns: minmax(0, 1.05fr) minmax(380px, .95fr);
    }

    .login-visual {
        position: relative;
        overflow: hidden;
        padding: clamp(22px, 4vh, 36px) clamp(22px, 3vw, 34px);
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        gap: clamp(14px, 2vh, 24px);
        min-width: 0;
        min-height: 0;
    }

    .visual-badge {
        position: relative;
        z-index: 2;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        width: fit-content;
        padding: 9px 13px;
        border-radius: 999px;
        background: rgba(255,255,255,.78);
        border: 1px solid rgba(255,255,255,.9);
        color: #1e3a8a;
        font-size: clamp(.82rem, 1.1vw, .9rem);
        font-weight: 700;
        backdrop-filter: blur(10px);
        box-shadow: 0 14px 30px rgba(37,99,235,.08);
    }

    .visual-badge-dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background: linear-gradient(180deg,#2563eb 0%,#1d4ed8 100%);
        box-shadow: 0 0 0 5px rgba(37,99,235,.1);
        flex: 0 0 auto;
    }

    .visual-copy {
        position: relative;
        z-index: 2;
        max-width: 500px;
        margin-top: 0;
    }

    .visual-copy h2,
    .visual-copy h3 {
        font-size: clamp(1.7rem, 2.4vw, 2.5rem);
        line-height: 1.08;
        font-weight: 800;
        margin: 0 0 12px;
        color: #0f172a;
        letter-spacing: -.03em;
    }

    .visual-copy p {
        margin: 0;
        font-size: clamp(.92rem, 1.15vw, 1rem);
        line-height: 1.62;
        color: #475569;
    }

    .visual-figure-wrap {
        position: relative;
        z-index: 2;
        display: flex;
        align-items: flex-end;
        justify-content: center;
        min-height: 0;
        flex: 1 1 auto;
        margin-top: 0;
    }

    .visual-figure-card {
        position: relative;
        width: 100%;
        max-width: 560px;
        height: clamp(220px, 38svh, 360px);
        border-radius: clamp(18px, 2vw, 28px);
        overflow: hidden;
        border: 1px solid rgba(255,255,255,.9);
        box-shadow: 0 26px 60px rgba(15,23,42,.12);
        background: linear-gradient(180deg,rgba(255,255,255,.18),rgba(255,255,255,.08)),#fff;
    }

    .visual-figure-card::after {
        content: '';
        position: absolute;
        inset: auto 0 0 0;
        height: 42%;
        background: linear-gradient(180deg,rgba(15,23,42,0) 0%,rgba(15,23,42,.08) 100%);
        pointer-events: none;
    }

    .visual-figure-image {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: center;
    }

    .visual-figure-chip {
        position: absolute;
        left: 16px;
        bottom: 16px;
        z-index: 3;
        display: inline-flex;
        align-items: center;
        gap: 10px;
        max-width: calc(100% - 32px);
        padding: 10px 12px;
        border-radius: 16px;
        background: rgba(255,255,255,.88);
        border: 1px solid rgba(255,255,255,.95);
        backdrop-filter: blur(10px);
        box-shadow: 0 18px 38px rgba(15,23,42,.12);
    }

    .visual-figure-chip strong { display: block; color: #0f172a; font-size: .9rem; line-height: 1.2; }
    .visual-figure-chip span { display: block; color: #64748b; font-size: .78rem; line-height: 1.2; }
    .visual-figure-chip-dot { width: 12px; height: 12px; border-radius: 50%; background: linear-gradient(180deg,#2563eb 0%,#1d4ed8 100%); box-shadow: 0 0 0 6px rgba(37,99,235,.1); flex: 0 0 auto; }

    .login-form-side {
        background: #fff;
        padding: clamp(28px, 5vh, 50px) clamp(30px, 4vw, 54px);
        display: flex;
        align-items: center;
        justify-content: center;
        min-width: 0;
        min-height: 0;
    }

    .login-form-wrap { width: 100%; max-width: 420px; }
    .login-brand { margin-bottom: clamp(18px, 3vh, 28px); }

    .login-brand h2,
    .login-brand h3 {
        margin: 0 0 8px;
        font-size: clamp(1.35rem, 1.7vw, 1.6rem);
        font-weight: 800;
        color: #0f172a;
        letter-spacing: -.03em;
    }

    .login-brand p { margin: 0; color: #64748b; font-size: clamp(.94rem, 1.1vw, 1rem); line-height: 1.55; }
    .login-card-error { margin-bottom: 16px; border-radius: 14px; border: 1px solid #fecaca; background: #fef2f2; color: #991b1b; padding: 12px 14px; font-weight: 600; display: none; }
    .login-card-error.show { display: block; }
    .login-form .mb-4 { margin-bottom: clamp(14px, 2.2vh, 22px) !important; }
    .login-form .mb-3 { margin-bottom: clamp(12px, 1.8vh, 18px) !important; }
    .login-form .form-label { font-size: clamp(.95rem, 1.1vw, 1.02rem); margin-bottom: 8px; color: #1e293b; font-weight: 700; }
    .login-form .form-control { min-height: clamp(50px, 6.8vh, 58px); border-radius: 16px; border: 1px solid #dbe4f0; background: #f8fbff; padding: 13px 16px; font-size: clamp(.98rem, 1.2vw, 1.08rem); color: #0f172a; transition: all .2s ease; }
    .login-form .form-control:focus { background: #fff; border-color: #93c5fd; box-shadow: 0 0 0 .24rem rgba(37,99,235,.12); }
    .login-meta-row { display: flex; align-items: center; justify-content: space-between; gap: 12px; margin: 6px 0 clamp(16px, 2.6vh, 24px); color: #64748b; font-size: .92rem; }
    .login-meta-row .form-check-label { color: #64748b; }
    .login-meta-row a { font-weight: 700; color: #2563eb; }
    .login-submit-btn { min-height: clamp(50px, 6.5vh, 58px); width: 100%; border-radius: 10px!important; font-size: clamp(1rem, 1.2vw, 1.08rem); font-weight: 800; letter-spacing: .01em; }
    .login-footer-note { margin-top: clamp(16px, 2.4vh, 24px); text-align: center; color: #64748b; font-size: .92rem; }

    @media (max-height: 760px) and (min-width: 992px) {
        .login-split-card { height: calc(100svh - 134px); }
        .login-visual { padding-top: 20px; padding-bottom: 20px; gap: 12px; }
        .visual-copy p { line-height: 1.48; }
        .visual-figure-card { height: clamp(190px, 33svh, 300px); }
        .login-form-side { padding-top: 24px; padding-bottom: 24px; }
        .login-brand { margin-bottom: 16px; }
        .login-footer-note { margin-top: 14px; }
    }

    @media (max-width: 991.98px) {
        html:has(.login-shell),
        body:has(.login-shell) { overflow: auto; }
        .jp-public-shell:has(.login-shell) { height: auto; max-height: none; margin-top: 0; padding-top: 18px; overflow: visible; display: block; }
        .login-shell { min-height: auto; height: auto; }
        .login-split-card { height: auto; max-height: none; grid-template-columns: 1fr; }
        .login-visual { min-height: auto; padding: 28px 24px; }
        .visual-figure-card { height: 300px; }
        .login-form-side { padding: 36px 24px 40px; }
    }

    @media (max-width: 767.98px) {
        .login-split-card { border-radius: 22px; }
        .login-visual { padding: 22px 18px 18px; }
        .visual-figure-card { height: 240px; }
        .visual-figure-chip { left: 14px; right: 14px; bottom: 14px; max-width: none; }
        .login-form-side { padding: 28px 18px 32px; }
        .login-meta-row { align-items: flex-start; flex-direction: column; }
    }
</style>

<div class="login-shell">
    <div class="login-split-card">
        <section class="login-visual">
            <div class="visual-badge"><span class="visual-badge-dot"></span>Smarter recruiting workflow</div>

            <div class="visual-copy">
                <h3>Hire faster without the chaos.</h3>
                <p>Keep candidates, conversations, scheduling, and office workflow in one clean place. Less spreadsheet archaeology. More actual recruiting.</p>
            </div>

            <div class="visual-figure-wrap">
                <div class="visual-figure-card">
                    <img src="/assets/images/sign_in_left.avif" alt="Recruiter workspace" class="visual-figure-image">
                    <div class="visual-figure-chip">
                        <span class="visual-figure-chip-dot"></span>
                        <div>
                            <strong>Recruiter workflow</strong>
                            <span>Candidates, conversations, and office ops in one place</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="login-form-side">
            <div class="login-form-wrap">
                <div class="login-brand">
                    <h3>Recruiter/Employer Sign in</h3>
                    <p>Use your email or username to access jobPortal.</p>
                </div>

                <div id="loginError" class="login-card-error"></div>

                <form id="loginForm" class="login-form" autocomplete="on">
                    <div class="mb-4">
                        <label class="form-label" for="loginField">Email or Username</label>
                        <input id="loginField" type="text" name="login" class="form-control" placeholder="Enter your email or username" autocomplete="username" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="passwordField">Password</label>
                        <input id="passwordField" type="password" name="password" class="form-control" placeholder="Enter your password" autocomplete="current-password" required>
                    </div>

                    <div class="login-meta-row">
                        <div class="form-check m-0">
                            <input class="form-check-input" type="checkbox" value="1" id="rememberCheck">
                            <label class="form-check-label" for="rememberCheck">Keep me signed in</label>
                        </div>
                    </div>

                    <button type="submit" id="loginBtn" class="btn btn-primary login-submit-btn">Recruiter/Employer Sign in</button>
                </form>

                <div class="login-footer-note">Secure access for recruiter and office workflow.</div>
            </div>
        </section>
    </div>
</div>

<script>
    $(function () {
        $('#loginForm').on('submit', function (e) {
            e.preventDefault();

            const $form = $(this);
            const $btn = $('#loginBtn');
            const $error = $('#loginError');

            $error.removeClass('show').text('');
            $btn.prop('disabled', true).text('Signing In...');

            $.ajax({
                url: '/login-ajax',
                method: 'POST',
                data: $form.serialize(),
                dataType: 'json'
            })
                .done(function (res) {
                    if (res && res.ok) {
                        window.location.href = res.redirect || '/';
                        return;
                    }

                    $error.addClass('show').text((res && res.message) ? res.message : 'Login failed. Please try again.');
                })
                .fail(function (xhr) {
                    let message = 'Login failed. Please try again.';

                    if (xhr.responseJSON && xhr.responseJSON.message) {
                        message = xhr.responseJSON.message;
                    } else if (xhr.responseText) {
                        try {
                            const parsed = JSON.parse(xhr.responseText);
                            if (parsed.message) {
                                message = parsed.message;
                            }
                        } catch (err) {}
                    }

                    $error.addClass('show').text(message);
                })
                .always(function () {
                    $btn.prop('disabled', false).text('Recruiter/Employer Sign in');
                });
        });
    });
</script>
