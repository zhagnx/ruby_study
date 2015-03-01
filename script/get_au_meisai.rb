#!/usr/bin/env ruby
#coding:utf-8
$KCODE = 'u'        if  RUBY_VERSION.to_f < 1.9
require 'rubygems'  if RUBY_VERSION.to_f < 1.9


module BillScraper

  #########################
  ##　サポートIDでログインが前提
  ## main_phone_number は ハイフン区切り必須
  ## out_path = BillScraper::au_current_month("takuyaXXXX", "password", "090-xXXX-9876" ,"1234");
  ##                                          ↑サポートID
  ##  au IDでのログインは電話番号がコロコロ変わる古事記には不要です。
  ##
  def au_current_month( id, password, main_phone_number ,  passcode )
    #pdftk は必須
    BillScraper::check_pdftk_exists?


    #クラスにするまでもないので、手続き型で行きます。

    #mechanize 初期化
    require "mechanize"
    m = Mechanize.new
    m.user_agent_alias = 'Windows IE 7'

    #ログインページ開く
    m.get "https://cs.kddi.com/support/login.html"
    #ログイン
    m.page.forms[1].field_with(:name=>"UserID").value  = id
    m.page.forms[1].field_with(:name=>"Password").value = password
    m.page.forms[1].submit

    #ページ遷移（ページを順番にたどる必要がある時に必須)
    # m.page.forms_with( :name=>/menu/i).first.fields_with(:id=>/selMenuKind/i).first.value= 'au_seikyu_seikyusho'
    # m.page.forms_with( :name=>/menu/i).first.submit


    #　料金表示されるメニューを表示する。

    m.page.forms_with(:name=>"selectTelAndServiceForm").first.fields_with( :name=>/menu/i).first.value = 1
    m.page.forms_with(:name=>"selectTelAndServiceForm").first.submit

    # 主回線の電話番号を選択
    fn = m.page.search("//td[text()='#{main_phone_number}']").first.parent().search("form").attr('name').to_s
    m.page.forms_with( :name => /#{fn}/).first.submit

    # 主回線の電話番号のパスコードを入れる
    m.page.forms.first.field_with(:name=>"auServicePassword").value = passcode
    m.page.forms.first.submit

    #ページ遷移
    m.page.body = m.page.body.toutf8   unless RUBY_VERSION.to_f < 1.9 # エンコード関連
    m.page.forms.first.submit

    #ページ遷移
    m.page.body = m.page.body.toutf8    unless RUBY_VERSION.to_f < 1.9 # エンコード関連

    # PDFを保存する。
    #   1:料金概要
    #   2:料金詳細 内訳
    #   最後に、概要＋詳細　▶　一枚PDFへ合成
    name = m.page.search("p.seikyu.mb10").text.strip.gsub(/\s+/, "")
    m.page.form_with( :name=>/download/i).submit
    gaiyou_path = "au-概要#{name}.pdf"
    m.page.save gaiyou_path


    m.back()
    m.page.form_with(:name => /details/).submit
    #m.page.body = m.page.body.toutf8



    m.page.form_with(:name => /pdf/).field_with(:name => "K2300A").value = 1
    m.page.form_with(:name => /pdf/).submit
    utiwake_path = "au-内訳#{name}.pdf"
    m.page.save utiwake_path


    out_path = "au-#{name}.pdf"

    `pdftk "#{gaiyou_path}"  "#{utiwake_path}" cat output "#{out_path}" `

    File.unlink gaiyou_path
    File.unlink utiwake_path

    return out_path
  end
  module_function :au_current_month

end
