module ApplicationHelper
    def write_time(tweet_time)
        if Time.zone.now < tweet_time then
            tmp = "" 
        elsif Time.zone.now.prev_year > tweet_time then
            tmp = tweet_time.year.to_s + "/" + tweet_time.month.to_s + "/" + tweet_time.day.to_s
        elsif Time.zone.now.yesterday > tweet_time then
            tmp = tweet_time.month.to_s + "/" + tweet_time.day.to_s
        elsif (Time.zone.now - tweet_time)/3600 >=1 then
            tmp = ((Time.zone.now - tweet_time)/3600).to_i.to_s + "時間前"
        elsif (Time.zone.now - tweet_time)/60 >=1 then
            tmp = ((Time.zone.now - tweet_time)/60).to_i.to_s + "分前"
        else
            tmp = (Time.zone.now - tweet_time).to_i.to_s + "秒前"
        end
        return tmp
    end        
end
