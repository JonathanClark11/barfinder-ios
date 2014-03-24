from twisted.internet.protocol import Protocol, Factory
from twisted.internet import reactor
import pdb

class IphoneChat(Protocol):
	def connectionMade(self):
		#self.transport.write("""connected""")
		self.factory.clients.append(self)
		print "clients are ", self.factory.clients
	
	def connectionLost(self, reason):
	    self.factory.clients.remove(self)
	    print "clients are ", self.factory.clients
	
	# TODO: PARSE BUFFERED PACKETS
	def dataReceived(self, data):
		print "data is " + data
		dataarr = data.split('\r\n');
		for command in dataarr:
			a = command.split(':')
			if len(a) > 1:
				command = a[0]
				content = a[1]
				room = None
				msg = ""
				if command == "iam":
					self.name = content
					msg = self.name + " has joined"
				
				#msg:room:message
				elif command == "msg":
					if (a[1] in chatrooms.keys()):
						if (self.name in chatrooms[a[1]]):
							room = a[1]
							msg = "msg:" + self.name + ":" + room + ":" + a[2] + "\n"
						else:
							room = None
							msg = "You are not in that chatroom"
					else:
						msg = "That room doesn't exist"
				
				#new:room
				elif command == "new":
					msg = self.name + " created room: " + content
					if (content in chatrooms):
						msg = "Could not create room (name already taken)"
					else:
						chatrooms[content] = [];

				#enter:room:user
				elif command == "enter":
					room = a[1]
					msg = self.name + " has entered " + content
					chatrooms[content].append(self.name)

				print msg
				if (room is None):
					for c in self.factory.clients:
						c.message(msg) #send global message
				else:
					#room is set, send the message to everybody in that room
					for user in chatrooms[room]:
						for c in self.factory.clients:
							if (c.name == user):
								print "\nSending message to " + user
								c.message(msg)
							
				
				
	def message(self, message):
		self.transport.write(message + '\n')


factory = Factory()
factory.protocol = IphoneChat
factory.clients = []
chatrooms = {};

reactor.listenTCP(80, factory)
print "Iphone Chat server started"
reactor.run()

