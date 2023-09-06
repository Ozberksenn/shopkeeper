// module.exports = (sequelize, DataTypes) => {
//   const UserModel = sequelize.define(
//     "User",
//     {
//       userName: {
//         type: DataTypes.STRING,
//         allowNull: false,
//       },
//       email: {
//         type: DataTypes.STRING,
//         unique: true,
//         isEmail: true,
//         allowNull: false,
//       },
//       password: {
//         type: DataTypes.STRING,
//         allowNull: false,
//       },
//     },
//     { timestamps: true }
//   );
//   return UserModel;
// };
