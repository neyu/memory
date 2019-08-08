/**
游戏-活动(ActivityEntity)
**/
package table

var TbActivity = 'uw_activity'

type ActivityEntity struct {
    /** 序号 **/
    Id int32/*序号*/
    /** 标题 **/
    Title string/*标题*/
    /** 类型 **/
    Type int8/*1:首冲
2:7天登陆
3:限时抢购
4:每日累充福利
5:全部累充福利
6:每日消费有礼
7:全部消费有礼
8:升级有奖
9:兑换码
*/
    /** icon类型 **/
    IconType int8/*icon类型*/
    /** 标题icon类型 **/
    TiIconType int8/*标题icon类型*/
    /** 开始时间 **/
    StartTime int64/*开始时间*/
    /** 结束时间 **/
    EndTime int64/*结束时间*/
    /** 物品 **/
    Items string/*{hero:{&quotid&quot:num,..},diamond:100,wipeItem:100}*/
    /** 随机英雄数据 **/
    RandomHeroes string/*[[种类数,总数]，.....]*/
    /** 扩展值 **/
    ExValues string/*首充:不需要
七天登陆:[英雄tid,........]
每日限购：[钻石数,........]
每日累冲：[钻石数,........]
全部累冲：[钻石数,........]
每日消费有礼：[钻石数,........]
全部消费有礼：[钻石数,........]
领主等级礼包：[领主等级,....]
兑换码：不需要
VIP等级礼包：[VIP等级,....]

时间段限购：[钻石数,........]*/
    /** 扩展值2 **/
    ExValues2 string/*每日限购：[限购数量,........]
时间段限购：[限购数量,........]*/
    /** 扩展值3 **/
    ExValues3 string/*每日限购：[几折,........]
时间段限购：[几折,........]*/
    /** 内容 **/
    Content string/*内容*/
    /** 是否开启 **/
    IsOpen int8/*是否发布*/
    /** 排序 **/
    Sort int8/*排序*/
    /** 活动额外信息 **/
    ExData string/*活动额外信息 {&quot1&quot:&quotjchd&quot}*/
    /** 活动模板ID **/
    TemplateId int32/*活动模板ID*/

}
