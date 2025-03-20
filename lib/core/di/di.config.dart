// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Features/forget_password_page/data/cubit/foreget_password_cubit.dart'
    as _i1052;
import '../../Features/forget_password_page/data/Data_Source/remote/foreget_password_impl.dart'
    as _i647;
import '../../Features/forget_password_page/data/Data_Source/remote/forget_password_remote.dart'
    as _i920;
import '../../Features/forget_password_page/data/Repositories/forget_passwod_repo.dart'
    as _i587;
import '../../Features/forget_password_page/data/Repositories/forget_password_impl.dart'
    as _i44;
import '../../Features/login_page/data/cubit/login_cubit.dart' as _i435;
import '../../Features/login_page/data/Data_Source/remote/login_remote.dart'
    as _i765;
import '../../Features/login_page/data/Data_Source/remote/login_remote_impl.dart'
    as _i1040;
import '../../Features/login_page/data/Repositories/login_impl.dart' as _i113;
import '../../Features/login_page/data/Repositories/login_repo.dart' as _i211;
import '../../Features/register_page/data/cubit/register_cubit.dart' as _i834;
import '../../Features/register_page/data/data_source/remote/register_user_remote.dart'
    as _i908;
import '../../Features/register_page/data/data_source/remote/register_user_remote_impl.dart'
    as _i452;
import '../../Features/register_page/data/Repositories/register_impl.dart'
    as _i68;
import '../../Features/register_page/data/Repositories/register_repositories.dart'
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
    gh.factory<_i920.ForgetPasswordRemote>(() => _i647.ForegetPasswordImpl());
    gh.factory<_i765.LoginRemote>(() => _i1040.LoginRemoteImpl());
    gh.factory<_i908.RegisterUserRemote>(() => _i452.RegisterUserRemoteImpl());
    gh.factory<_i211.LoginRepo>(
        () => _i113.LoginImpl(loginRemote: gh<_i765.LoginRemote>()));
    gh.factory<_i409.RegisterRepo>(() =>
        _i68.RegisterImpl(registerUserRemote: gh<_i908.RegisterUserRemote>()));
    gh.factory<_i587.ForgetPasswodRepo>(() => _i44.ForgetPasswordImpl(
        forgetPasswordRemote: gh<_i920.ForgetPasswordRemote>()));
    gh.factory<_i1052.ForegetPasswordCubit>(
        () => _i1052.ForegetPasswordCubit(gh<_i587.ForgetPasswodRepo>()));
    gh.factory<_i834.RegisterCubit>(
        () => _i834.RegisterCubit(gh<_i409.RegisterRepo>()));
    gh.factory<_i435.LoginCubit>(() => _i435.LoginCubit(gh<_i211.LoginRepo>()));
    return this;
  }
}
