Openneo Auth Signatory
----------------------

This is a Ruby gem that, given a message and a secret, produces a signature.

Openneo auth servers use this gem to sign messages they send to auth clients,
and auth clients use this gem to sign the message they receive to make sure
that they get the same signature. This confirms that the authentication message
was sent by someone who knows the secret (in this case, the auth server),
rather than some hacker trying to send his or her own fake message.

    secret = '5ebe2294ecd0e0f08eab7690d2a6ee69'
    signatory = Openneo::Auth::Signatory.new(secret)
    
    message = {:foo => 1, :bar => 2}
    signature = signatory.sign(message)
    
    puts signature # => 22dc5ff40bcf9ece92f8b6cf6542b05750aea9379d27e048b32ec02a65e33641
