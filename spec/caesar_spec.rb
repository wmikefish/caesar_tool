require "spec_helper"
require "caesar"

describe Caesar do
# ROTn=rotate by n placesで、n文字分回すという意味

  ROTN = ['ABCDEFGHIJKLMNOPQRSTUVWXYZ',
          'BCDEFGHIJKLMNOPQRSTUVWXYZA',
          'CDEFGHIJKLMNOPQRSTUVWXYZAB',
          'DEFGHIJKLMNOPQRSTUVWXYZABC',
          'EFGHIJKLMNOPQRSTUVWXYZABCD',
          'FGHIJKLMNOPQRSTUVWXYZABCDE',
          'GHIJKLMNOPQRSTUVWXYZABCDEF',
          'HIJKLMNOPQRSTUVWXYZABCDEFG',
          'IJKLMNOPQRSTUVWXYZABCDEFGH',
          'JKLMNOPQRSTUVWXYZABCDEFGHI',
          'KLMNOPQRSTUVWXYZABCDEFGHIJ',
          'LMNOPQRSTUVWXYZABCDEFGHIJK',
          'MNOPQRSTUVWXYZABCDEFGHIJKL',
          'NOPQRSTUVWXYZABCDEFGHIJKLM',
          'OPQRSTUVWXYZABCDEFGHIJKLMN',
          'PQRSTUVWXYZABCDEFGHIJKLMNO',
          'QRSTUVWXYZABCDEFGHIJKLMNOP',
          'RSTUVWXYZABCDEFGHIJKLMNOPQ',
          'STUVWXYZABCDEFGHIJKLMNOPQR',
          'TUVWXYZABCDEFGHIJKLMNOPQRS',
          'UVWXYZABCDEFGHIJKLMNOPQRST',
          'VWXYZABCDEFGHIJKLMNOPQRSTU',
          'WXYZABCDEFGHIJKLMNOPQRSTUV',
          'XYZABCDEFGHIJKLMNOPQRSTUVW',
          'YZABCDEFGHIJKLMNOPQRSTUVWX',
          'ZABCDEFGHIJKLMNOPQRSTUVWXY',
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ']

###　dencrypt
  it "EHOLがROT13でRUBYになること" do
    expect(Caesar.dencrypt('EHOL', 13)).to eq 'RUBY'
  end

  it "RUBYがROT13でEHOLになること" do
    expect(Caesar.dencrypt('RUBY', 13)).to eq 'EHOL'
  end

  it "ROT13を２回かけると元に戻ること" do
    ciphertext = 'RUBY'
    rot13text = Caesar.dencrypt(ciphertext, 13)
    expect(Caesar.dencrypt(rot13text, 13)).to eq ciphertext
  end

  it "IBMがROT25でHALになること" do
    expect(Caesar.dencrypt('IBM', 25)).to eq 'HAL'
  end

  it "HALがROT1でIBMになること" do
    expect(Caesar.dencrypt('HAL', 1)).to eq 'IBM'
  end

  it "ROT26で元にもどること" do
    ciphertext = 'HAL'
    expect(Caesar.dencrypt(ciphertext, 26)).to eq ciphertext
  end

  it "ALHABETSのROT0~26が全て正しいこと" do
    0...ROTN.length do |i|
      expect(Caesar.dencrypt("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i)).to eq ROTN[i]
    end
  end

### brute_force_attack
  it "brute_force_attackがROT0~25になってること" do
    expect(Caesar.brute_force_attack("ABCDEFGHIJKLMNOPQRSTUVWXYZ")).to eq ROTN[0..25]
  end
end
