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
        type:           " data",
        doctype:        " jsonp",
        version:        "1.1",
        relatedUrl:     "http://fanyi.youdao.com/openapi?path=Dweb-mode&mode=Ddicter",
        keyfrom:        "test",
        key:            "null",
        callback:       "YoudaoDicter.Instance.update",
        translate:      "on",
        q:              word
    })
    resp = http.post(uri.request_uri, data, nil)
    json =  JSON.parse(resp.body.match(/YoudaoDicter.Instance.update\((.*)\)/)[1])
    result = (
        if basic = json['basic']
            {   
                spell: word, 
                us_phonetic: basic['us-phonetic'],
                uk_phonetic: basic['uk-phonetic'],
                explains: basic['explains'][0]
            }
        else
            nil
        end
    )
end