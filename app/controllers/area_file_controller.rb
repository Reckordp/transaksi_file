class AreaFileController < ApplicationController
  def index
  end
  def upload
    if terkirim = params['File']
      terkirim.each(&method(:simpan_file))
    end
    redirect_to root_path
  end
  def tulisan
    t = params.permit(:tulisan)['tulisan']
    Clipboard.copy(t) unless t.empty?
    redirect_to root_path
  end

  private
  def simpan_file(io_file)
    tempat = Rails.root.join('public', 'terkirim', io_file.original_filename)
    f = File.new(tempat, "wb")
    until io_file.eof?
      f.pos = f.size
      f.write(io_file.read(64))
    end
    f.close
    io_file.close
  end
end
