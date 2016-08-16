Mail App - SendMail
===========

This is a ruby library. It can be used to generate mails from the SMTP server with Attachements as well. It leverages native ruby library Net::SMTP. It also use another gem, named "mail", based method to generate mail.


Prerequisites
------------------
Install these via your platform's preferred method (apt, yum, ports, emerge, etc.):

	git
	ruby 2.0.0 or later
	rubygems
	bundler

Connectivity to SMTP server.

Usage
---------
Folowing are the variables needed by SendMail.

	from = "test@test.com"
	to = "mpriyada@brocade.com"
	smtp_host = "10.88.88.007"
	smtp_port = 25
	subject = "Status mail"
	body = "Howdy!"
	attachement_file = "/Users/mpriyada/myWorks/ap.txt"


viaNetSmtp(smtp_host, smtp_port, from, to, subject, body, attachement_file)

-  It sends mail with "Net::SMTP" module after compressing the attachment file.

viaMailSmtp(smtp_host, smtp_port, from, to, subject, body, attachement_file)

-  It sends mail with "mail" module without compressing the attachment file.


License
-----------
SendMail is released under the APACHE 2.0 license. See ../LICENSE for more information.