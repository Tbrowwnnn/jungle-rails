describe('visit home page', () => {
  // beforeEach(() => {
  //   // Cypress starts out with a blank slate for each test
  //   // so we must tell it to visit our website with the `cy.visit()` command.
  //   // Since we want to visit the same URL at the start of all our tests,
  //   // we include it in our beforeEach function so that it runs before each test
  //   cy.visit('localhost:3000')
  // })
  it('Loads the home page', () => {
    // We use the `cy.get()` command to get all elements that match the selector.
    // Then, we use `should` to assert that there are two matched items,
    // which are the two default items.
    cy.visit('/')
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  })
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  })
  it("Should navigate to the product page correctly", () => {
    cy.get(".products article").should("have.length", 2);
  })

  it("Should add an item to cart when clicked", () => {
    cy
    .get("[action='/cart/add_item?product_id=2']")
    .click()

    cy
    .get("[class='nav-item end-0']")
    .contains(" My Cart (1)")
  })
})