# -- 概要 --
# コマンドライン引数で文字列を入力として受け取り、rot1~rot25までを一覧で表示する

# -- やりたい改変 --
# カエサル復号、暗号化を作る →　クラス化する
# 大文字、小文字どちらにも対応
# keywordが含まれるものを当てるのも作る
# テストを組む

class Caesar
  ALPHABETS = Array('A'..'Z')
  ALPHABETS.map!(&:freeze).freeze # イミュータブル化

  def self.dencrypt(ciphertext, shift)
    check_ciphertext_nil(ciphertext)
    ciphertext.upcase.each_char.inject('') do |plaintext, c|
      if ALPHABETS.include?(c)
        i = (ALPHABETS.index(c) + shift) % ALPHABETS.length
        plaintext << ALPHABETS[i]
      else
        plaintext << c
      end
    end
  end

  def self.brute_force_attack(ciphertext)
    (0...ALPHABETS.length).map { |shift| dencrypt(ciphertext, shift) }
  end

  private
  # のちに例外機構などにして、メソッド内orクラス内に埋め込む
  def self.check_ciphertext_nil(ciphertext)
    if ciphertext.nil?
      puts "please input ciphertext!"
      exit
    end
  end
end

ciphertext = ARGV[0];
puts Caesar.brute_force_attack(ciphertext)
