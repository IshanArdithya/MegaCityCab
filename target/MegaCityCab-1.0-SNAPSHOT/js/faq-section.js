document.querySelectorAll('.faq-item').forEach(item => {
    const toggleButton = item.querySelector('.faq-toggle i');

    item.querySelector('.faq-question').addEventListener('click', () => {
        item.classList.toggle('active');

        if (item.classList.contains('active')) {
            toggleButton.classList.replace('ri-add-fill', 'ri-subtract-fill');
        } else {
            toggleButton.classList.replace('ri-subtract-fill', 'ri-add-fill');
        }
    });
});