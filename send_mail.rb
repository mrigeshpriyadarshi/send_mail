require 'net/smtp'

class SendMail
	def self.installGem(name)
		cmd = "gem install #{name}"
		if %x[gem list #{name}].strip.empty?
			%x[#{cmd}] 
			puts "Installed Dependency Gem-> #{name.capitalize}"
		else
			puts "#{name.capitalize} Gem Already Present !!!"
		end
	end

	def self.viaNetSmtp(smtp_host, smtp_port, from, to, subject, body, attachement_file)

		filename = attachement_file
		filecontent = File.read(filename)
		encodedcontent = [filecontent].pack("m")   # base64
		marker = "AUNIQUEMARKER"

		part1 = <<-EOF.gsub(/^\t\t\t/, '')
			From: <#{from}>
			To: <#{to}>
			Subject: #{subject}
			MIME-Version: 1.0
			Content-Type: multipart/mixed; boundary=#{marker}
			--#{marker}
		EOF


		part2 = <<-EOF.gsub(/^\t\t\t/, '')
			Content-Type: multipart/alternative; boundary=#{marker}
			Content-Transfer-Encoding:8bit

			--#{marker}
		EOF

		message = <<-EOF.gsub(/^\t\t\t/, '')
			Content-Type: text/html
			Content-Transfer-Encoding:8bit

			<b><i>#{body}!!!</i><br><br>This is a mail with an attachement. This is an e-mail message in HTML format.</b>
			--#{marker}
		EOF

		part4 = <<-EOF.gsub(/^\t\t\t/, '')
			Content-Type: multipart/mixed; name=#{filename}
			Content-Transfer-Encoding:base64
			Content-Disposition: attachment; filename=#{filename}

			#{encodedcontent}
			--#{marker}--
		EOF

		mailtext =  part1 + part2 + message + part4

		begin

			Net::SMTP.start(smtp_host, smtp_port) do |smtp|
				smtp.sendmail(mailtext, from,to)
				puts "Mail Sent"
		  	end
		rescue Exception => e
			print "Exception occured: " + e.to_s
		end	
	end

	def self.viaMailSmtp(smtp_host, smtp_port, from, to, subject, body, attachement_file)
		begin

			installGem("mail")
			require	'mail'
			Mail.defaults do
				delivery_method :smtp, address: smtp_host, port: smtp_port
			end

			mail = Mail.new do
				from     from
				to       to
				subject  subject
				add_file attachement_file
				html_part do
					content_type 'text/html; charset=UTF-8'
					body "<b><i>#{body}!!!</i><br><br>This is a mail with an attachement. This is an e-mail message in HTML format."
				end
			end

			mail.deliver!
			puts "Mail Sent"
			
		rescue Exception => e
			puts "Error: #{e.message}"
		end
	end
end