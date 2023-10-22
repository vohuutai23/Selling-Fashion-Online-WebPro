const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

const loginBtns = document.querySelectorAll('.js-login')
const modal = document.querySelector('.js-modal')
const modalContainer = document.querySelector('.js-modal-container')
const modalClose = document.querySelector('.js-modal-close')

function showLogin() {
    modal.classList.add('open')
}

function hideLogin() {
    modal.classList.remove('open')

}
for (const loginBtn of loginBtns) {
    loginBtn.addEventListener('click', showLogin)
}
modalClose.addEventListener('click', hideLogin)

modal.addEventListener('click', hideLogin)

modalContainer.addEventListener('click', function(event) {
    event.stopPropagation()
})