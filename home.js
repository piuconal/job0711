const text = "Welcome to BeautySchool!";
const textContainer = document.getElementById("text-container");

for (let i = 0; i < text.length; i++) {
  const char = text.charAt(i);
  const span = document.createElement("span");
  span.textContent = char;
  span.style.animationDelay = `${i * 0.1}s`;
  textContainer.appendChild(span);
}