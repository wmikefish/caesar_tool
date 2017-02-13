# -- 概要 --
# コマンドライン引数で文字列を入力として受け取り、rot1~rot25までを一覧で表示する

# -- やりたい改変 --
# カエサル暗号化を作る
# keywordが含まれるものを当てるのも作る

class Caesar
  def self.dencrypt(ciphertext, rot_n)
    alert_ciphertext_nil(ciphertext)
    ciphertext.each_char.inject('') do |plaintext, c|
      if ('A'..'Z').include?(c)
        plaintext << rotate(c, rot_n)
      elsif ('a'..'z').include?(c)
        plaintext << rotate(c, rot_n, false)
      else
        plaintext << c
      end
    end
  end

  def self.brute_force_attack(ciphertext)
    (0...ALPHABETS_LENGTH).map { |rot_n| dencrypt(ciphertext, rot_n) }
  end

  private
  ALPHABETS_LENGTH = 26
  def self.rotate(c, rot_n, is_upcase = true)
    base = (is_upcase ? 'A' : 'a').ord
    i = (c.ord - base + rot_n) % ALPHABETS_LENGTH + base
    i.chr
  end

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
