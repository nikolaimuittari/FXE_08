*** Settings ***
Library     RPA.Email.Exchange

*** Variables ***
${SMTP_ACCOUNT}        test@domain.com
${SMTP_PASSWORD}       ${EMPTY}

${SMTP SERVER}     10.100.1.111  # Replace with the actual IP address
${SMTP PORT}       25
${SENDER}          test@domain.com
${RECIPIENT}       receiver@domain.com
${SUBJECT}         Test email to smtp4dev using IP
${BODY}            This is a test email sent to smtp4dev using an IP address.

*** Test Cases ***
Task of sending email
    Send Message  recipients=${RECIPIENT}
    ...           subject=Exchange Message from RPA Robot
    ...           body=<p>Exchange RPA Robot message body<br><img src='myimage.png'/></p>
    ...           save=${TRUE}
    ...           html=${TRUE}


    Send SMTP Email    sender=${SENDER}    recipients=${RECIPIENT}    subject=${SUBJECT}    body=${BODY}    server=${SMTP SERVER}    port=${SMTP PORT}    use_ssl=False    use_tls=False