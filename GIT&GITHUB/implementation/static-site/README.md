# Deploying Static HTML Page to GitHub Pages with Custom Workflow

## Steps:

1. Create a new repository on GitHub
   - Go to GitHub.com and create a new repository
   - Initialize with a README if desired

2. Prepare your local project
   - Clone the repository to your local machine
   - Add your HTML, CSS, and other static files
   - Create a new branch called `gh-pages` (optional)

3. Configure GitHub Pages
   - Go to repository Settings
   - Navigate to Pages section
   - Select 'Deploy from a branch' as Source
   - Choose `gh-pages` branch
   - Save the settings

4. Deploy your site
   - Commit and push your changes to main branch
   - GitHub Actions will automatically build and deploy
   - Wait for the workflow to complete

5. Access your site
   - Your site will be available at: `https://<username>.github.io/<repository-name>`
   - Check the Pages section in Settings for the published URL

## Notes:
- Make sure your repository is public or you have GitHub Pro for private repositories
- The main HTML file should be named `index.html`
- Custom domains can be configured in the Pages settings
- The workflow will run automatically on every push to main branch

## github actions workflow using github actions tab
- go to actions tab 
- click on set up a workflow yourself 
- folder will created by .github/workflows
- name the workflow as deploy.yml(YAML Ain't Markup Language)
- copy the workflow code from workflow.md

```
name: Deploy Vite React App

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pages: write
      id-token: write

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Set up Node.js
        uses: actions/setup-node@v3
        with:
          node-version: 18
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build project
        run: npm run build
        env:
          NODE_ENV: production

      - name: Setup Pages
        uses: actions/configure-pages@v3

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: dist

      - name: Deploy to GitHub Pages
        uses: actions/deploy-pages@v2
        with:
          token: ${{ secrets.GITHUB_TOKEN }}

- commit the changes
- wait for the workflow to complete
- access the site

Note: 
- indentation is important in yaml
- use 2 spaces for indentation
- use colon(:) for key value pair
- use hyphen(-) for list
- use pipe(|) for multi line string
- use quote(') for single quote
- use double quote(") for double quote
- use backtick(`) for multi line command
- use comment(#) for comment
