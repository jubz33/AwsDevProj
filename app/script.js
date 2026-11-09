const body = document.body
const btnTheme = document.querySelector('#btn-theme')
const themeLabel = btnTheme.querySelector('.theme__label')
const btnHamburger = document.querySelector('#btn-navigation')
const navList = document.querySelector('.nav__list')
const btnScrollTop = document.querySelector('.scroll-top')
const mobileViewport = window.matchMedia('(max-width: 600px)')

const setTheme = (theme) => {
  const dark = theme === 'dark'
  body.classList.toggle('dark', dark)
  body.classList.toggle('light', !dark)
  const nextMode = dark ? 'Light mode' : 'Night mode'
  themeLabel.textContent = nextMode
  btnTheme.setAttribute('aria-label', `Switch to ${nextMode.toLowerCase()}`)
}

// Storage can be unavailable in private browsing or local file previews.
try {
  setTheme(localStorage.getItem('portfolio-theme'))
} catch {
  setTheme('light')
}

btnTheme.addEventListener('click', () => {
  const theme = body.classList.contains('dark') ? 'light' : 'dark'
  setTheme(theme)
  try {
    localStorage.setItem('portfolio-theme', theme)
  } catch {
    // The theme still works for this visit when preferences cannot be saved.
  }
})

const setNavigation = (open) => {
  navList.classList.toggle('display-nav-list', open)
  btnHamburger.setAttribute('aria-expanded', String(open))
  btnHamburger.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation')
}

btnHamburger.addEventListener('click', () => {
  setNavigation(btnHamburger.getAttribute('aria-expanded') !== 'true')
})

navList.querySelectorAll('a').forEach((link) => {
  link.addEventListener('click', () => {
    setNavigation(false)
    if (mobileViewport.matches) {
      const section = document.querySelector(link.getAttribute('href'))
      section.setAttribute('tabindex', '-1')
      section.focus({ preventScroll: true })
    }
  })
})

document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape' && btnHamburger.getAttribute('aria-expanded') === 'true') {
    setNavigation(false)
    btnHamburger.focus()
  }
})

document.addEventListener('click', (event) => {
  if (!event.target.closest('.nav')) setNavigation(false)
})

mobileViewport.addEventListener('change', () => setNavigation(false))
body.classList.add('js-enabled')

const scrollUp = () => {
  btnScrollTop.style.display = window.scrollY > 500 ? 'block' : 'none'
}

document.addEventListener('scroll', scrollUp, { passive: true })
scrollUp()
