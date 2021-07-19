Rails.application.routes.draw do
  get 'bahan' => 'bahan#index'
  get 'bahan/kirim' => 'bahan#kirim'
  get 'bahan/lihat' => 'bahan#lihat'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'area_file/index'
  post 'area_file/upload'
  post 'area_file/tulisan'
  root 'area_file#index'
end
