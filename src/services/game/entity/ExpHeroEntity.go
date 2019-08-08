/**
游戏-远征英雄备份(ExpHeroEntity)
游戏-远征英雄备份
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: 0/*用户id*/
    /** 模板id **/
    tempId: 0/*模板id*/
    /** 品阶 **/
    quality: 0/*品阶*/
    /** 强化 **/
    intensifyArr: null/*强化[等级,等级,...] 下标对应装备位置*/
    /** 星级 **/
    starArr: null/*星级[星级,星级,...] 下标对应装备位置*/
    /** 宝石 **/
    gemArr: null/*宝石[id,id,id,...]下标对应装备位置*/
    /** 翅膀 **/
    wingArr: null/*翅膀[id,等级,星级,当前星经验,左翅强化等级,右翅强化等级]*/
    /** 经验 **/
    expc: 0/*经验*/
    /** 等级 **/
    lvl: 0/*等级*/
    /** 装备数据 **/
    equipData: null/*{&quot部位&quot:物品id,....}*/
    /** 技能等级组 **/
    skillLvlArr: null/*[技能1等级,技能2等级...]*/
    /** 最终属性组 **/
    propArr: null/*最终属性组[值,值]*/
    /** 境界等级 **/
    realmLvl: 0/*境界等级*/
    /** 境界符文组 **/
    realmArr: null/*境界符文组  [0,1,2,3,4,5]*/
    /** 性别 **/
    sex: 1/*性别 1:男 2:女*/
    /** 战斗力 **/
    combat: 0/*战斗力*/
    /** 装备精炼 **/
    refineArr: null/*装备精炼[等级,等级,...] 下标对应装备位置*/
    /** 升星突破 **/
    starTopArr: null/*升星突破[升星突破重数,升星突破重数,...] 下标对应装备位置*/
    /** 法宝佩戴 **/
    talismanAdorn: null/*法宝佩戴*/
    /** 法宝数据 **/
    talismanData: null/*法宝数据{法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],....}*/
    /** 法宝共鸣 **/
    talismanFg: null/*法宝共鸣{共鸣id:[0,1],共鸣id:[1,0],...}*/
    /** 翅膀总等级 **/
    wingSumLvl: null/*翅膀等级*100+星数*/
    /** 宝石总等级 **/
    gemSumLvl: null/*宝石总等级*/
    /** 境界总等级 **/
    realmSumLvl: null/*境界等级 * 100 + 已装备个数*/
    /** 出战顺序 **/
    fightSort: null/*出战顺序*/
    /** 元婴背包 **/
    soulArr: null/*{&quot元婴id&quot:[物品id,剩余血量,今日是否有穿戴过]}*/
    /** 佩戴元婴 **/
    wearSoulId: null/**/
    /** 记录时间 **/
    recordTime: null/**/

}
_Class.tableName: 'uw_expedition_hero'