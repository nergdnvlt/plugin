let userId = ""

function buyProd(fsProdPath) {
  fastspring.builder.add(fsProdPath);
  // fastspring.builder.update(fsProdPath, 4);
  fastspring.builder.checkout();
}

function popupWebhookReceived(fsData) {
  if ( fsData ) {
    let orderInfo = {
      user: {
        fs_id: fsData.account
      },
      order: {
        orderId: fsData.id
      }
    }

    userId = fsData.account

    fetch('api/v1/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(orderInfo)
    })
    .then(function(response) {
      return response.status
    })
  }
}

function popupClose( orderReference ) {
  if ( orderReference ) {
    debugger
    fastspring.builder.reset()
    window.location.replace(`localhost:3000/${userId}`);
  } else {
    window.location.replace("localhost:3000/");
  }

}