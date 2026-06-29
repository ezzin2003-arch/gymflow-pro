import '../entities/member.dart';
import '../repositories/member_repository.dart';

class AddMember {
  final MemberRepository repository;

  AddMember(this.repository);

  Future<void> call(Member member) {
    return repository.addMember(member);
  }
}
