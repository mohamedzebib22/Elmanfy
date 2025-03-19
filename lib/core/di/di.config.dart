// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.factory<_i908.RegisterUserRemote>(() => _i452.RegisterUserRemoteImpl());
    gh.factory<_i409.RegisterRepo>(() =>
        _i68.RegisterImpl(registerUserRemote: gh<_i908.RegisterUserRemote>()));
    gh.factory<_i834.RegisterCubit>(
        () => _i834.RegisterCubit(gh<_i409.RegisterRepo>()));
    return this;
  }
}
