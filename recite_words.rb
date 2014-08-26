require 'net/http'
require 'json'
def gen_form_data(list)
    data = ""
    list.each do |key, val|
      data<<"#{key}=#{val}"<<'&'
    end
    data.chop
end
def query_word(word)
    uri = URI("http://fanyi.youdao.com/openapi.do")  
    http = Net::HTTP.start(uri.host, uri.port)
    data = gen_form_data({
        type:" data",
        doctype:" jsonp",
        version:"1.1",
        relatedUrl:"http://fanyi.youdao.com/openapi?path=Dweb-mode&mode=Ddicter",
        keyfrom:"test",
        key:"null",
        callback:"YoudaoDicter.Instance.update",
        translate:"on",
        q:"hello"
    })
    resp = http.post(uri.request_uri, data, nil)
    json =  JSON.parse(resp.body.match(/YoudaoDicter.Instance.update\((.*)\)/)[1])
    puts json['translation'][0]
    puts json['basic']['us-phonetic']
    puts json['basic']['uk-phonetic']
    puts json['basic']['explains']
end
# loop do
#     word = gets
#     p word
# end

query_word('hello')