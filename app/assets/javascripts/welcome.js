let userId = ""

function buyProd(fsProdPath) {
  fastspring.builder.add(fsProdPath);
  fastspring.builder.checkout();
}

function popupWebhookReceived(fsData) {
  if ( fsData.id ) {
    userId = fsData.id
    let user = { id: userId }
    fetch('api/v1/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(user)
    })
    .then(function(response) { return response.json(); })
  }
}