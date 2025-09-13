# Deploying Static HTML Page to GitHub Pages with Custom Workflow

## Steps:

1. Create a new repository on GitHub
   - Go to GitHub.com and create a new repository
   - Initialize with a README if desired

2. Prepare your local project
   - Clone the repository to your local machine
   - Add your HTML, CSS, and other static files
   - Create a new branch called `gh-pages` (optional)

3. Create GitHub Actions workflow
   - Create `.github/workflows` directory in your repository
   - Create a new file `deploy.yml` with the following content:
   ```yaml
   name: Deploy to GitHub Pages
   
   on:
     push:
       branches: [ main ]
     workflow_dispatch:
   
   jobs:
     deploy:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         
         - name: Deploy to GitHub Pages
           uses: peaceiris/actions-gh-pages@v3
           with:
             github_token: ${{ secrets.GITHUB_TOKEN }}
             publish_dir: .
   ```

4. Configure GitHub Pages
   - Go to repository Settings
   - Navigate to Pages section
   - Select 'Deploy from a branch' as Source
   - Choose `gh-pages` branch
   - Save the settings

5. Deploy your site
   - Commit and push your changes to main branch
   - GitHub Actions will automatically build and deploy
   - Wait for the workflow to complete

6. Access your site
   - Your site will be available at: `https://<username>.github.io/<repository-name>`
   - Check the Pages section in Settings for the published URL

## Notes:
- Make sure your repository is public or you have GitHub Pro for private repositories
- The main HTML file should be named `index.html`
- Custom domains can be configured in the Pages settings
- The workflow will run automatically on every push to main branch
