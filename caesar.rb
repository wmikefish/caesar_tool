# -- 概要 --
# コマンドライン引数で文字列を入力として受け取り、rot1~rot25までを一覧で表示する

# -- やりたい改変 --
# カエサル復号、暗号化を作る →　クラス化する
# 大文字、小文字どちらにも対応
# upcaseに落として、小文字であとで元に戻す！
# keywordが含まれるものを当てるのも作る
# テストを組む

ALPHABETS = Array('A'..'Z')
ALPHABETS.map!(&:freeze).freeze # イミュータブル化

def dencrypt(ciphertext, shift)
  ciphertext.upcase.each_char.inject('') do |plaintext, c|
    i = (ALPHABETS.index(c) + shift) % ALPHABETS.length
    plaintext << ALPHABETS[i]
  end
end

def brute_force_attack(ciphertext)
  (0...ALPHABETS.length).map { |shift| dencrypt(ciphertext, shift) }
end

# のちに例外機構などにして、メソッド内orクラス内に埋め込む
def check_ciphertext_nil(ciphertext)
  if ciphertext.nil?
    puts "please input ciphertext argument"
    exit
  end
end

ciphertext = ARGV[0];
check_ciphertext_nil(ciphertext)
puts brute_force_attack(ciphertext)
