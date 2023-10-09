def quiz_game(quiz_data)
  score = 0
  quiz_data.each do |data|
    sleep(1.5) # optimized performance
    system('clear') # optimized performance user comfortable
    puts data[:question] # putting question here
    data[:options].each do |opt| # putting options here
      puts "  #{opt} \n"
    end
    answer = gets.chomp.upcase
    puts 'Please Enter Single Character Only ' if answer.length != 1
    if answer == data[:correct_answer]
      puts "=========GoodJob=========\n"
      score += 1
    else
      puts 'You can do better next time!'
      puts "The correct answer is #{data[:correct_answer]}" unless answer.length != 1
    end
  end
  feedback(score, quiz_data)
end

def feedback(score, quiz_data)
  percent_scored = (score / quiz_data.length) * 100 # 'cause of dynamic data, I did here percentile comparision
  if score.zero?
    puts '-----------Better Luck next time-----------'
  elsif percent_scored >= 50.0 && percent_scored < 75
    puts '-----------Very good job-----------'
  elsif percent_scored >= 75
    puts "\n-----------Excellent score-----------"
  end
  puts "you have scored #{score} correct answers"
end

def execute(choice, quiz_data)
  case choice
  when 1
    puts '--------------Welcome to the Ruby Quiz Game--------------'
    quiz_game(quiz_data)
  when 2
    puts 'Thank you for playing the quiz!'
  else
    puts 'Please Enter a Valid Input'
  end
end

def run_app(quiz_data)
  choice = nil
  loop do
    puts "============================\n\n1. Play Game 2. Exit"
    puts 'Enter your choice: '
    choice = gets.to_i
    execute(choice, quiz_data)
    break if choice == 2
  end
end

def main
  quiz_data =
    [
    { question: 'What is the capital of France?',
      options: ['A. London', 'B. Madrid', 'C. Paris'],
      correct_answer: 'C' },
    { question: 'What is the capital of India?',
      options: ['A. Delhi', 'B. Mumbai', 'C. Goa'],
      correct_answer: 'A' },
    { question: 'What is the capital of MadhyaPradesh?',
      options: ['A. Bhopal', 'B. Indore', 'C. Ujjain'],
      correct_answer: 'A' },
    { question: 'What is the Electric Capital of MadhyaPradesh?',
      options: ['A. Singrauli', 'B. Betul', 'C. Sidhi'],
      correct_answer: 'A' },
    { question: 'What is the finance Capital of India?',
      options: ['A. Delhi', 'B. Mumbai', 'C. Goa'],
      correct_answer: 'B' },
    { question: 'What is the Old Capital of MadhyaPradesh?',
      options: ['A. Sehore', 'B. Betul', 'C. Sidhi'],
      correct_answer: 'A' },
    { question: 'What is the name of Indore Airport?',
      options: ['A. Deev Port', 'B. Raja Bhoj', 'C. Holkar'],
      correct_answer: 'C' }
    ]
  run_app(quiz_data)
end

main
