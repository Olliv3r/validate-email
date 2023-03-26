# coding=utf-8

try:
    from validate_email_address import validate_email
    import sys
    import threading

except ImportError as err:
    print err
    exit(1)

def validate(email):
    result = validate_email(str(email), verify=True)

    if result:
        print '\033[32mVálido: \033[33;1m%s\033[0m\n' % email
    
    else:
        print '\033[32mInválido: \033[31;1m%s\033[0m\n' % email

def check(emailList):
    emails = open(emailList, 'r')

    for email in emails:
        email = email.rstrip()

        thread = threading.Thread(target=validate, args=(email,))
        thread.start()

def main():
    try:
        check(sys.argv[1])
        
    except IndexError:
        print "Tente python2 %s <emailList>" % sys.argv[0]

if __name__ == '__main__':
    main()
