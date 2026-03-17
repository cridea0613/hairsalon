const siteData = window.SALON_PUBLIC_SITE || {};
const menuToggle = document.querySelector('.menu-toggle');
const mainNav = document.querySelector('.main-nav');

if (menuToggle && mainNav) {
  const closeMenu = () => {
    mainNav.classList.remove('is-open');
    menuToggle.setAttribute('aria-expanded', 'false');
  };

  menuToggle.addEventListener('click', () => {
    const isOpen = mainNav.classList.toggle('is-open');
    menuToggle.setAttribute('aria-expanded', String(isOpen));
  });

  mainNav.querySelectorAll('a').forEach((link) => {
    link.addEventListener('click', closeMenu);
  });

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape') {
      closeMenu();
    }
  });
}

document.querySelectorAll('[data-year]').forEach((node) => {
  node.textContent = String(new Date().getFullYear());
});

document.querySelectorAll('[data-site-email]').forEach((node) => {
  if (!siteData.supportEmail) {
    return;
  }

  node.textContent = siteData.supportEmail;

  if (node instanceof HTMLAnchorElement) {
    node.href = `mailto:${siteData.supportEmail}`;
  }
});

document.querySelectorAll('[data-site-phone]').forEach((node) => {
  if (!siteData.supportPhone) {
    return;
  }

  node.textContent = siteData.supportPhone;

  if (node instanceof HTMLAnchorElement && siteData.supportPhoneHref) {
    node.href = `tel:${siteData.supportPhoneHref}`;
  }
});

document.querySelectorAll('[data-site-hours]').forEach((node) => {
  if (siteData.supportHours) {
    node.textContent = siteData.supportHours;
  }
});

document.querySelectorAll('[data-site-coverage]').forEach((node) => {
  if (siteData.supportCoverage) {
    node.textContent = siteData.supportCoverage;
  }
});

const contactForm = document.querySelector('#contact-form');
const formFeedback = document.querySelector('#form-feedback');

if (contactForm instanceof HTMLFormElement && formFeedback) {
  contactForm.addEventListener('submit', (event) => {
    event.preventDefault();

    if (!contactForm.reportValidity()) {
      return;
    }

    const formData = new FormData(contactForm);
    const name = String(formData.get('name') || '').trim();
    const email = String(formData.get('email') || '').trim();
    const organization = String(formData.get('organization') || '').trim();
    const message = String(formData.get('message') || '').trim();
    const subjectParts = ['Salon Public inquiry'];

    if (organization) {
      subjectParts.push(`from ${organization}`);
    }

    const body = [
      `Name: ${name}`,
      `Email: ${email}`,
      `Organization: ${organization || 'N/A'}`,
      '',
      'Project summary:',
      message
    ].join('\n');

    const destinationEmail = siteData.supportEmail || 'hello@hairsalon-market.example.com';
    const mailtoUrl = `mailto:${destinationEmail}?subject=${encodeURIComponent(subjectParts.join(' '))}&body=${encodeURIComponent(body)}`;

    formFeedback.hidden = false;
    formFeedback.textContent = 'Your default mail app will open with the inquiry details. If it does not open, use the email link in the contact panel.';
    window.location.href = mailtoUrl;
  });
}
