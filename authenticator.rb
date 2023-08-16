class User
def initialize(user)
    @username=user[:username]
    @password=user[:password]
end
end

$users = [
    { username: "hrithik", password: "hri786" },
    { username: "ashish", password: "ashi786" },
    { username: "rajeev", password: "raj786" },
    { username: "ishita", password: "ish786" },
]

def checkuser(username ,password)
    $users.each {    
        |user|
        if (user[:username]==username && user[:password]==password)
            return User.new(user)
        end
    }
    return false
end
# checkuser("jdkfk","fhjhfj")

puts "This Program will take Input from User and compare password"
puts "if correct we eill get back the user object"

# attempts=1
while true
    puts "1. Authenticator\n2.Quit"
    choice=gets.to_i
    case choice
    when 1
        25.times{ print "_" }
        puts
        puts "Enter username:"
        username = gets.chomp
    
        puts "Enter password:"
        password = gets.chomp

        25.times{ print "_" }
        found=checkuser(username ,password)
        puts found
        
        if (!found)
            puts "Not Found"
        elsif (found.class==Object)
            "object recv."
        else
            puts "Credentials were Incorrect"
        end

    when 2
        exit
    else
        puts "Wrong Input Please try Again"
    end  
end
