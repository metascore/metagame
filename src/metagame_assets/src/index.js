import { metagame } from "../../declarations/metagame";

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  // Interact with metagame actor, calling the greet method
  const greeting = await metagame.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
