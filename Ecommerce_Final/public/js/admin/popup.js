// Get Modal Elements
const iframeModal = document.getElementById('iframePopup');
// const openIframeButton = document.getElementById('openIframePopup');
const closeIframeModal = document.querySelector('.close');

const allIframeLinks = document.querySelectorAll('a[id="openIframePopup"]');
allIframeLinks.forEach(link => {
    link.addEventListener('click', () => {
      iframeModal.style.display = 'block';
    });
});

// Open Modal
// openIframeButton.addEventListener('click', () => {
//   iframeModal.style.display = 'block';
// });

// Close Modal
closeIframeModal.addEventListener('click', () => {
  iframeModal.style.display = 'none';
});

// Close Modal on Click Outside
window.addEventListener('click', (event) => {
  if (event.target === iframeModal) {
    iframeModal.style.display = 'none';
  }
});
