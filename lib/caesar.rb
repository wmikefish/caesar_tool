# -- 概要 --
# コマンドライン引数で文字列を入力として受け取り、rot1~rot25までを一覧で表示する

# -- やりたい改変 --
# カエサル暗号化を作る
# 大文字、小文字どちらにも対応
# keywordが含まれるものを当てるのも作る
# テストを組む

class Caesar
  U_ALPHABETS = Array('A'..'Z')
  U_ALPHABETS.map!(&:freeze).freeze # イミュータブル化
  L_ALPHABETS = Array('a'..'z')
  L_ALPHABETS.map!(&:freeze).freeze

  def self.dencrypt(ciphertext, shift)
    alert_ciphertext_nil(ciphertext)
    ciphertext.each_char.inject('') do |plaintext, c|
      if U_ALPHABETS.include?(c)
        i = (U_ALPHABETS.index(c) + shift) % U_ALPHABETS.length
        plaintext << U_ALPHABETS[i]
      elsif L_ALPHABETS.include?(c)
        i = (L_ALPHABETS.index(c) + shift) % L_ALPHABETS.length
        plaintext << L_ALPHABETS[i]
      else
        plaintext << c
      end
    end
  end

  def self.brute_force_attack(ciphertext)
    (0...U_ALPHABETS.length).map { |shift| dencrypt(ciphertext, shift) }
  end

  private
  # のちに例外機構などにして、メソッド内orクラス内に埋め込む
  def self.alert_ciphertext_nil(ciphertext)
    if ciphertext.nil?
      puts "please input ciphertext!"
      exit
    end
  end
end

# ciphertext = ARGV[0];
# puts Caesar.brute_force_attack(ciphertext)
