az staticwebapp create `
    --name vided-react-app `
    --sku Free `
    --resource-group vided `
    --source https://github.com/Pratik-1188/vided-react-app `
    --branch main `
    --login-with-github

# first time you do this it willfail, go to the .yaml deploymen file in .github folder and then update output location to output_location: "/"