import html
import os
import boto3


ENV = os.environ["ENV"]
BUCKET_NAME = os.environ["BUCKET_NAME"]


def lambda_handler(event, context):
    print(event)
    username = event.get('userName', '')
    company_name = event['request'].get('userName', '')
    email = event.get("userName")
    code = event["request"].get("codeParameter")
    link = event["request"].get("linkParameter")
    name = event["request"]["userAttributes"].get('bda_name', email)
    url_env = f"app.{ENV}.zerobdc.com" if ENV != 'prod' else "app.zerobdc.com"

    # read template
    if (ENV == "prod" and event['triggerSource'] == "CustomMessage_SignUp") or (ENV == "prod" and event['triggerSource'] == "CustomMessage_ForgotPassword"):

        signup_template_raw = read_template(
            BUCKET_NAME, "email_templates/signup.html")
        signup_template = add_data(
            {"username": name, "code": code, "username_link": name, "code_link": code, "url_env": url_env}, signup_template_raw)
        forgot_password_template_raw = read_template(
            BUCKET_NAME, "email_templates/forgot_password.html")
        forgot_password_template = add_data(
            {"name": name, "code": code, "email_link": email, "code_link": code}, forgot_password_template_raw)
    
    else:
        

        if (event['triggerSource'] == "CustomMessage_SignUp") or (event['triggerSource'] == "CustomMessage_ForgotPassword") or (event['triggerSource'] == "CustomMessage_SignUp") or (event['triggerSource'] == "CustomMessage_ForgotPassword"):
            signup_template_raw = read_template(
                BUCKET_NAME, "email_templates/signup.html")
            signup_template = add_data({"username": name, "url_env": url_env,  "code": code,
                                       "username_link": name, "code_link": code}, signup_template_raw)
    
            forgot_password_template_raw = read_template(
                BUCKET_NAME, "email_templates/forgot_password.html")
            forgot_password_template = add_data(
                {"name": name, "env": ENV, "code": code, "email_link": email, "code_link": code}, forgot_password_template_raw)
        
        if (event['triggerSource'] == "CustomMessage_AdminCreateUser"):
            register_user_template_raw = read_template(
                BUCKET_NAME, "email_templates/signup.html")
            register_user_template = add_data(
                {"name": name, "env": ENV, "code": code, "email_link": email, "code_link": code, "link":link}, register_user_template_raw)

        if event['triggerSource'] == "CustomMessage_SignUp":
            event['response']['emailSubject'] = "[abcon] Registration Email Verification"
            event['response']['emailMessage'] = signup_template
    
        if event["triggerSource"] == "CustomMessage_ResendCode":
            event['response']['emailSubject'] = "[abcon] Registration Email Verification"
            event['response']['emailMessage'] = signup_template
    
        if event['triggerSource'] == "CustomMessage_ForgotPassword":
            event['response']['emailSubject'] = "[abcon] Request to reset your password"
            event['response']['emailMessage'] = forgot_password_template
    
        if event['triggerSource'] == "CustomMessage_UpdateUserAttribute":
            event['response']['emailSubject'] = "Validate your new email"
            event['response']['emailMessage'] = "Hi <b>" + username + "</b>!<br>" \
                                                "Click <a href='abcon-sbx.cecurepractice.link/confirm-email-change?" \
                                                "code=" + code + "'>here</a> " \
                                                "to validate your new email."
    
        if event['triggerSource'] == "CustomMessage_SignUp":
            print('HERERERE')
            event['response']['emailSubject'] = "Your ZeroBDC Platform Account Login Details"
            # event['response']['emailMessage'] = register_user_template
            event['response']['emailMessage'] = f'''
                                                <br>
                                                <h3>Hello,</h3> 
                                                <p>Welcome to the ZeroBDC web application platform!!</p>
                                                <p>We want to ensure a smooth onboarding experience for you.</p> 
                                                <h4>Your login credentials are:</h4>
                                                <p><span>Email: </span><b>{{username}}</b></p>
                                                <p><span>Password: </span><b>{{####}}</b></p>
                                                <p>To access our platform, <a href="https://app.{ENV}.zerobdc.com/ng?email={{username}}" target="_blank" rel="noopener noreferrer">click here.</a></p>
                                                <p>You will be asked to change your password the first time you log in
                                                to ensure the security of your account. We recommend setting up multi-factor
                                                authentication (MFA) to further secure your account.</p>
                                                <p>If you experience any trouble or have any questions, please contact our support team at
                                                <a href="mailto:help@cil.support">help@cil.support</a></p>
                                                  <p>Welcome once again.</p> 
                                                  <p>Sincerely,</p> 
                                                  <p>ZeroBDC Team.</p>
                                                '''


    print(event)
    return event


def read_template(bucketname, keyname):
    s3 = boto3.resource('s3')
    obj = s3.Object(bucketname, keyname)
    body = obj.get()['Body'].read()
    body = body.decode("utf-8")

    return body


def add_data(variables={}, code=""):
    print({"variables": variables})
    for variable in variables:
        print(variable)
        code = code.replace("{{"+str(variable)+"}}", variables[variable])
    return code
