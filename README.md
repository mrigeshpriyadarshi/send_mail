Mail App - SendMail
===========

This is a ruby library. It can be used to generate mails from the SMTP server with Attachements as well. It leverages native ruby library Net::SMTP. It also use another gem, named "mail", based method to generate mail.


Prerequisites
------------------
- Install these via your platform's preferred method (apt, yum, ports, emerge, etc.):

		git
		ruby 2.0.0 or later
		rubygems
		bundler

- Connectivity to SMTP server.

Methods
-----------
- viaNetSmtp()

  -  It sends mail with "Net::SMTP" module after compressing the attachment file.

- viaMailSmtp()

  -  It sends mail with "mail" module without compressing the attachment file.

Usage
---------
Following are the variables which needs to be set and passed to methods.

	from = "test@test.com"
	to = "mpriyada@brocade.com"
	smtp_host = "10.88.88.007"
	smtp_port = 25
	subject = "Status mail"
	body = "Howdy!"
	attachement_file = "/Users/mpriyada/myWorks/ap.txt"

Then, methods can be called as:-

- SendMail.viaNetSmtp(smtp_host, smtp_port, from, to, subject, body, attachement_file)

or

- SendMail.viaMailSmtp(smtp_host, smtp_port, from, to, subject, body, attachement_file)


License
-----------
SendMail is released under the APACHE 2.0 license. See LICENSE for more information.