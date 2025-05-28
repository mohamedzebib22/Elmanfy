// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/forget_password_page/data/cubit/foreget_password_cubit.dart'
    as _i185;
import '../../features/forget_password_page/data/Data_Source/remote/foreget_password_impl.dart'
    as _i396;
import '../../features/forget_password_page/data/Data_Source/remote/forget_password_remote.dart'
    as _i990;
import '../../features/forget_password_page/data/Repositories/forget_passwod_repo.dart'
    as _i674;
import '../../features/forget_password_page/data/Repositories/forget_password_impl.dart'
    as _i313;
import '../../features/home_page/data/cubits/add_dept/add_dept_cubit.dart'
    as _i182;
import '../../features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart'
    as _i1056;
import '../../features/home_page/data/cubits/cubit/delete_dept_cubit.dart'
    as _i98;
import '../../features/home_page/data/cubits/dept_paid_done/dept_paid_done_cubit.dart'
    as _i878;
import '../../features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_cubit.dart'
    as _i261;
import '../../features/home_page/data/cubits/get_dept/get_dept_cubit.dart'
    as _i944;
import '../../features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart'
    as _i657;
import '../../features/home_page/data/Data_Source/add_user/add_user_remote.dart'
    as _i183;
import '../../features/home_page/data/Data_Source/add_user/add_user_remote_impl.dart'
    as _i884;
import '../../features/home_page/data/Data_Source/get_and_delete_user/get_and_delete_user_remote.dart'
    as _i606;
import '../../features/home_page/data/Data_Source/get_and_delete_user/get_and_delete_user_remote_impl.dart'
    as _i1053;
import '../../features/home_page/data/Repos/add_user/add_user_impl.dart'
    as _i51;
import '../../features/home_page/data/Repos/add_user/add_user_repo.dart'
    as _i945;
import '../../features/home_page/data/Repos/get_user/get_user_impl.dart'
    as _i62;
import '../../features/home_page/data/Repos/get_user/get_user_repo.dart'
    as _i198;
import '../../features/login_page/data/cubit/login_cubit.dart' as _i132;
import '../../features/login_page/data/Data_Source/remote/login_remote.dart'
    as _i425;
import '../../features/login_page/data/Data_Source/remote/login_remote_impl.dart'
    as _i255;
import '../../features/login_page/data/Repositories/login_impl.dart' as _i676;
import '../../features/login_page/data/Repositories/login_repo.dart' as _i188;
import '../../features/register_page/data/cubit/register_cubit.dart' as _i926;
import '../../features/register_page/data/data_source/remote/register_user_remote.dart'
    as _i1052;
import '../../features/register_page/data/data_source/remote/register_user_remote_impl.dart'
    as _i815;
import '../../features/register_page/data/Repositories/register_impl.dart'
    as _i666;
import '../../features/register_page/data/Repositories/register_repositories.dart'
    as _i777;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i183.AddUserRemote>(() => _i884.AddUserRemoteImpl());
    gh.factory<_i425.LoginRemote>(() => _i255.LoginRemoteImpl());
    gh.factory<_i1052.RegisterUserRemote>(() => _i815.RegisterUserRemoteImpl());
    gh.factory<_i606.GetUserRemote>(() => _i1053.GetUserRemoteImpl());
    gh.factory<_i990.ForgetPasswordRemote>(() => _i396.ForgetPasswordImpl());
    gh.factory<_i198.GetUserRepo>(
        () => _i62.GetUserImpl(getUserRemote: gh<_i606.GetUserRemote>()));
    gh.factory<_i777.RegisterRepo>(() => _i666.RegisterImpl(
        registerUserRemote: gh<_i1052.RegisterUserRemote>()));
    gh.factory<_i945.AddUserRepo>(
        () => _i51.AddUserImpl(addUserRemote: gh<_i183.AddUserRemote>()));
    gh.factory<_i674.ForgetPasswordRepo>(() => _i313.ForgetPasswordImpl(
        forgetPasswordRemote: gh<_i990.ForgetPasswordRemote>()));
    gh.factory<_i188.LoginRepo>(
        () => _i676.LoginImpl(loginRemote: gh<_i425.LoginRemote>()));
    gh.factory<_i926.RegisterCubit>(
        () => _i926.RegisterCubit(gh<_i777.RegisterRepo>()));
    gh.factory<_i182.AddDeptCubit>(
        () => _i182.AddDeptCubit(gh<_i945.AddUserRepo>()));
    gh.factory<_i1056.AddUserCubit>(
        () => _i1056.AddUserCubit(gh<_i945.AddUserRepo>()));
    gh.factory<_i98.DeleteDeptCubit>(
        () => _i98.DeleteDeptCubit(gh<_i945.AddUserRepo>()));
    gh.factory<_i878.DeptPaidDoneCubit>(
        () => _i878.DeptPaidDoneCubit(gh<_i945.AddUserRepo>()));
    gh.factory<_i944.GetDeptCubit>(
        () => _i944.GetDeptCubit(gh<_i945.AddUserRepo>()));
    gh.factory<_i657.GetDeptsDoneCubit>(
        () => _i657.GetDeptsDoneCubit(gh<_i945.AddUserRepo>()));
    gh.factory<_i132.LoginCubit>(() => _i132.LoginCubit(gh<_i188.LoginRepo>()));
    gh.factory<_i185.ForegetPasswordCubit>(
        () => _i185.ForegetPasswordCubit(gh<_i674.ForgetPasswordRepo>()));
    gh.factory<_i261.GetUserCubit>(
        () => _i261.GetUserCubit(gh<_i198.GetUserRepo>()));
    return this;
  }
}
