import { chromium } from 'playwright';

(async () => {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();
  await page.goto('http://localhost:5173/');
  
  // Wait for the game to load
  await page.waitForTimeout(2000);
  
  // Assuming the main screen has a button to start a scenario, try to click the first scenario
  // Or navigate directly to the scenario if possible. We can click on "Colores y Formas"
  console.log("Looking for scenario...");
  const textMatches = await page.getByText('Colores y Formas');
  if (await textMatches.count() > 0) {
    await textMatches.first().click();
    console.log("Clicked Colores y Formas");
  } else {
    // try English version UI
    const textMatches2 = await page.getByText('Colors & Shapes');
    if (await textMatches2.count() > 0) {
      await textMatches2.first().click();
      console.log("Clicked Colors & Shapes");
    }
  }

  // Wait for questions to load
  await page.waitForTimeout(2000);
  
  // Look for the bank words. They are usually within the DOM.
  console.log("Finding words...");
  
  // We'll log all text content of elements that look like words to click
  // Or we just take a screenshot and list locators
  const buttons = await page.$$('div > span:nth-child(2)'); // SortableItemUI has the word in span
  for (const btn of buttons) {
    console.log("Found word:", await btn.innerText());
  }

  // Find the button with COMPROBAR
  const testCheck = await page.getByRole('button', { name: /comprobar/i });
  console.log("Check button exists:", await testCheck.count() > 0);

  await browser.close();
})();
