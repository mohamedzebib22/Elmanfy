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
    as _i1052;
import '../../features/forget_password_page/data/Data_Source/remote/foreget_password_impl.dart'
    as _i647;
import '../../features/forget_password_page/data/Data_Source/remote/forget_password_remote.dart'
    as _i920;
import '../../features/forget_password_page/data/Repositories/forget_passwod_repo.dart'
    as _i587;
import '../../features/forget_password_page/data/Repositories/forget_password_impl.dart'
    as _i44;
import '../../features/home_page/data/cubits/add_dept/add_dept_cubit.dart'
    as _i106;
import '../../features/home_page/data/cubits/add_user_cubit/add_user_cubit.dart'
    as _i483;
import '../../features/home_page/data/cubits/cubit/delete_dept_cubit.dart'
    as _i47;
import '../../features/home_page/data/cubits/dept_paid_done/dept_paid_done_cubit.dart'
    as _i1020;
import '../../features/home_page/data/cubits/get_and_delete_user_cubit/get_and_delete_user_cubit.dart'
    as _i967;
import '../../features/home_page/data/cubits/get_dept/get_dept_cubit.dart'
    as _i578;
import '../../features/home_page/data/cubits/get_dept_done/get_depts_done_cubit.dart'
    as _i907;
import '../../features/home_page/data/Data_Source/add_user/add_user_remote.dart'
    as _i781;
import '../../features/home_page/data/Data_Source/add_user/add_user_remote_impl.dart'
    as _i413;
import '../../features/home_page/data/Data_Source/get_and_delete_user/get_and_delete_user_remote.dart'
    as _i594;
import '../../features/home_page/data/Data_Source/get_and_delete_user/get_and_delete_user_remote_impl.dart'
    as _i640;
import '../../features/home_page/data/Repos/add_user/add_user_impl.dart'
    as _i607;
import '../../features/home_page/data/Repos/add_user/add_user_repo.dart'
    as _i692;
import '../../features/home_page/data/Repos/get_user/get_user_impl.dart'
    as _i282;
import '../../features/home_page/data/Repos/get_user/get_user_repo.dart'
    as _i1053;
import '../../features/login_page/data/cubit/login_cubit.dart' as _i435;
import '../../features/login_page/data/Data_Source/remote/login_remote.dart'
    as _i765;
import '../../features/login_page/data/Data_Source/remote/login_remote_impl.dart'
    as _i1040;
import '../../features/login_page/data/Repositories/login_impl.dart' as _i113;
import '../../features/login_page/data/Repositories/login_repo.dart' as _i211;
import '../../features/register_page/data/cubit/register_cubit.dart' as _i834;
import '../../features/register_page/data/data_source/remote/register_user_remote.dart'
    as _i908;
import '../../features/register_page/data/data_source/remote/register_user_remote_impl.dart'
    as _i452;
import '../../features/register_page/data/Repositories/register_impl.dart'
    as _i68;
import '../../features/register_page/data/Repositories/register_repositories.dart'
    as _i409;

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
    gh.factory<_i765.LoginRemote>(() => _i1040.LoginRemoteImpl());
    gh.factory<_i594.GetUserRemote>(() => _i640.GetUserRemoteImpl());
    gh.factory<_i781.AddUserRemote>(() => _i413.AddUserRemoteImpl());
    gh.factory<_i920.ForgetPasswordRemote>(() => _i647.ForgetPasswordImpl());
    gh.factory<_i908.RegisterUserRemote>(() => _i452.RegisterUserRemoteImpl());
    gh.factory<_i1053.GetUserRepo>(
        () => _i282.GetUserImpl(getUserRemote: gh<_i594.GetUserRemote>()));
    gh.factory<_i587.ForgetPasswordRepo>(() => _i44.ForgetPasswordImpl(
        forgetPasswordRemote: gh<_i920.ForgetPasswordRemote>()));
    gh.factory<_i211.LoginRepo>(
        () => _i113.LoginImpl(loginRemote: gh<_i765.LoginRemote>()));
    gh.factory<_i409.RegisterRepo>(() =>
        _i68.RegisterImpl(registerUserRemote: gh<_i908.RegisterUserRemote>()));
    gh.factory<_i967.GetUserCubit>(
        () => _i967.GetUserCubit(gh<_i1053.GetUserRepo>()));
    gh.factory<_i1052.ForegetPasswordCubit>(
        () => _i1052.ForegetPasswordCubit(gh<_i587.ForgetPasswordRepo>()));
    gh.factory<_i692.AddUserRepo>(
        () => _i607.AddUserImpl(addUserRemote: gh<_i781.AddUserRemote>()));
    gh.factory<_i834.RegisterCubit>(
        () => _i834.RegisterCubit(gh<_i409.RegisterRepo>()));
    gh.factory<_i435.LoginCubit>(() => _i435.LoginCubit(gh<_i211.LoginRepo>()));
    gh.factory<_i106.AddDeptCubit>(
        () => _i106.AddDeptCubit(gh<_i692.AddUserRepo>()));
    gh.factory<_i483.AddUserCubit>(
        () => _i483.AddUserCubit(gh<_i692.AddUserRepo>()));
    gh.factory<_i47.DeleteDeptCubit>(
        () => _i47.DeleteDeptCubit(gh<_i692.AddUserRepo>()));
    gh.factory<_i1020.DeptPaidDoneCubit>(
        () => _i1020.DeptPaidDoneCubit(gh<_i692.AddUserRepo>()));
    gh.factory<_i578.GetDeptCubit>(
        () => _i578.GetDeptCubit(gh<_i692.AddUserRepo>()));
    gh.factory<_i907.GetDeptsDoneCubit>(
        () => _i907.GetDeptsDoneCubit(gh<_i692.AddUserRepo>()));
    return this;
  }
}
