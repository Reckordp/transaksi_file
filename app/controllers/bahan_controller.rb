class BahanController < ApplicationController
  FOLDER_BAHAN = File.join(Rails.root, 'bahan')
  BKN_FOLDER = ['.', '..']

  def index
    @bahan = pemilahan_bahan(Dir.entries(FOLDER_BAHAN), FOLDER_BAHAN)
  end

  def pemilahan_bahan(gumpalan, alm, bahan = Hash.new)
    gumpalan.each do |bhn|
      alamat = File.join(alm, bhn)
      if File.file?(alamat)
        cpy = 1
        bhan = bhn.dup
        while bahan.keys.include?(bhan)
          cpy += 1
          bhan = "#{bhn}#{cpy}"
        end
        next bahan[bhan] = alamat
      end
      next false if BKN_FOLDER.include? bhn
      next false if Dir.empty? alamat
      pemilahan_bahan(Dir.entries(alamat), alamat, bahan)
    end
    return bahan
  end

  def kirim
    if params[:kiriman]
      send_file params[:kiriman]
    end
  end

  def lihat
    respond_to do |rt|
      rt.html { render inline: File.read(File.join(Rails.root, 'bahan', 'geolocation.html')) }
    end
  end
end
