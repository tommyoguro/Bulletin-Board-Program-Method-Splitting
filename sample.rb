while true
  puts "実施したい処理を選択してください"
  puts "1 : 評価ポイントとコメントを入力する"
  puts "2 : 今までの結果を確認する"
  puts "3 : やめる"
  num = gets.to_i

  case num
  when 1
    input_evaluation_and_comment
  when 2
    display_results
  when 3
    puts "終了します"
    break
  else
    puts "1から3で入力してください"
  end
end

#評価ポイントとコメントの入力処理
def input_evaluation_and_comment
  evaluation = request_evaluation_point
  comment = request_comment
  store_result(evaluation, comment)
end

#評価ポイントの入力を促す
def request_evaluation_point
  loop do
    puts "評価ポイントを入力してください（1から5)"
    evaluation = gets.to_i
    return evaluation if (1..5).include?(evaluation)

    puts "1から5で入力してください"
  end
end 

#コメントの入力を促す
def request_comment
　puts "コメントを入力してください"
  gets.chomp
end 

#評価結果とコメントを保存する処理
$results =[] #結果の保存先

def display_results
  if $results.empty?
    puts "結果はまだありません"
  else
    puts "これまでの評価結果:"
    $results.each_with_index do |result, index|
      puts "##{index +1} 評価: #{result[:evaluation]},コメント: #{result[:comment]}"
    end
  end
end 

#終了処理
 def end_program
  puts "終了します"
 end

#メイン処理の呼び出し
main_menu
