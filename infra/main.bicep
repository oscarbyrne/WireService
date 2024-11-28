module app 'modules/app.bicep' = {
  name: 'WireService-app'
  // TODO: separate params into env files
  params: {
    appName: 'WireService672'
    branch: 'main'
  }
}