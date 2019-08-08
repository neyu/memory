/**
游戏-心法神功(HeartStuntEntity)
心法神功
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*公会个人信息id*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 境界数据 **/
    stateArr: null/*境界数据
境界槽位对应选择的心法[心法id,心法id,...]*/
    /** 心法等级数据 **/
    heartLvlArr: null/*心法等级数据
境界槽位下标对应心法的等级[lvl,lvl,...]*/

}
_Class.tableName: 'uw_heart_stunt'